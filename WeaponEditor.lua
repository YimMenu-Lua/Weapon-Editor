-- Author: George Chang (George0828Zhang)
-- Credits:
--  read xml      http://lua-users.org/wiki/LuaXml
--  print table   (hashmal)  https://gist.github.com/hashmal/874792
--  worldpointer  (DDHibiki) https://www.unknowncheats.me/forum/grand-theft-auto-v/496174-worldptr.html
--  offsets       (Yimura) https://github.com/Yimura/GTAV-Classes
--  offsets       (alexguirre) https://alexguirre.github.io/rage-parser-dumps/
--  ptfx          (DurtyFree) https://github.com/DurtyFree/gta-v-data-dumps/

myTab = gui.get_tab("Weapon Editor") -- or put "GUI_TAB_WEAPONS"
enabled = true
attachmentCB = true
verbose = true

require("lib/xmlreader")
require("lib/gtaenums")
require("lib/gtaoffsets")

--------------------------------- DEBUG
function log_info(msg)
    log.info(msg)
end
function log_debug(msg)
    if verbose then
        log.debug(msg)
    end
end

function tprint(tbl, indent, log_fn)
    if not indent then indent = 0 end
    if not log_fn then log_fn = log_debug end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. tostring(k) .. ": "
        if type(v) == "table" then
            log_fn(formatting)
            tprint(v, indent+1)
        else
            log_fn(formatting .. tostring(v))
        end
    end
end

--------------------------------- PARSING
function handle_enum(name, value)
    for k, enum in pairs(gta_enums) do
        if name:find(k) ~= nil then
            if k == "Explosion" then value = value:gsub("EXP_TAG_", "") end
            return enum[value]
        end
    end
    log.warning("[enum] Unseen enum/flag: "..value.." in "..name)
    return nil
end

function resolve_offset(offset_val, at_array, _base)
    local offset = {val=offset_val}
    if at_array then
        offset = {ref=offset_val, val=0}
    end
    if _base ~= nil then
        offset.val = offset.val + _base.val
        offset.ref = _base.ref -- TODO: what if at_array under at_array?
    end
    return offset
end

function append_tag(parent_tag, key)
    return (parent_tag=="") and key or (parent_tag.."."..key)
end

function recursive_parse_into_gta_form(inner_table, output_table, request_registry, value_pack, next_tag)
    -- recursive call
    for sub_k, sub_v in pairs(value_pack) do
        parse_into_gta_form(inner_table, output_table, request_registry, sub_v, next_tag)
    end
end

function parse_into_gta_form_array(offset_table, output_table, request_registry, value_pack, parent_tag)
    -- array syntax
    -- base, "array", ItemTemplate, count
    local key = value_pack.label
    local offset = resolve_offset(offset_table[key][1], offset_table[key][2] == "at_array", offset_table._base)

    local inner_table = offset_table[key].ItemTemplate -- should be another table
    local interval = offset_table[key].ItemSize
    local count = 0
    for _, value_item in ipairs(value_pack) do
        if value_item.label == "Item" then
            inner_table._base = {
                val=offset.val + count * interval,
                ref=offset.ref
            }
            recursive_parse_into_gta_form(inner_table, output_table, request_registry, value_item, append_tag(parent_tag, key))
            count = count + 1
        end
    end
    -- handle count (if template have count.)
    if offset_table[key].Count ~= nil then
        local cnt_offset = resolve_offset(offset_table[key].Count[1], false, offset_table._base)
        local gta = (offset_table[key].Count[2]=="int") and "dword" or "word"
        table.insert(output_table, {offset=cnt_offset, gtatype=gta, val=count})
    end
end

function parse_into_gta_form(offset_table, output_table, request_registry, value_pack, parent_tag)
    if type(value_pack) ~= "table" or value_pack.label == nil or offset_table[value_pack.label] == nil then
        return
    end
    local key = value_pack.label

    local next_tag = append_tag(parent_tag, key)
    if offset_table[key][1] == nil then
        local inner_table = offset_table[key] -- should be another table
        recursive_parse_into_gta_form(inner_table, output_table, request_registry, value_pack, next_tag)
    elseif offset_table[key][2]:find("array") ~= nil then
        parse_into_gta_form_array(offset_table, output_table, request_registry, value_pack, parent_tag)
    else
        -- has offset + not array
        local offset = resolve_offset(offset_table[key][1], false, offset_table._base)
        local typ = offset_table[key][2]
        local value = value_pack[1]
        if value_pack.empty and value_pack.xarg.value ~= nil then
            value = value_pack.xarg.value -- e.g. <ClipSize value="6" />
        end
        local gta = "dword" -- default
        if typ == "hash" then
            local hash = joaat(value ~= nil and value or "")
            request_registry[hash] = {key=next_tag, val=string.lower(tostring(value)), hash=hash}
            value = hash
        elseif typ == "enum" then
            value = handle_enum(next_tag, value)
        elseif typ == "enum16" then
            value = handle_enum(next_tag, value)
            gta = "word"
        elseif typ == "int" then
            value = tonumber(value)
        elseif typ == "byte" then
            value = tonumber(value)
            gta = "byte"
        elseif typ == "bool" then
            value = (value == "true") and 1 or 0
            gta = "byte"
        elseif typ:find("^flags") ~= nil then -- flags32, flags192 etc
            bits = {}
            for w in value:gmatch("%S+") do
                table.insert(bits, handle_enum(key, w))
            end
            value = bits
            gta = typ:gsub("flags", "bitset")
        elseif typ:find("^ref_") then
            value = value_pack.xarg.ref
            value = {type=typ:gsub("ref_", ""), hash=joaat(value ~= nil and value or ""), name=value}
            gta = "ref"
        elseif typ == "vec2" then
            value = tonumber(value_pack.xarg.x)
            gta = "float"
            table.insert(output_table, {offset={val=offset.val+4, ref=offset.ref}, gtatype="float", val=tonumber(value_pack.xarg.y)})
        elseif typ == "vec3" then
            value = tonumber(value_pack.xarg.x)
            gta = "float"
            table.insert(output_table, {offset={val=offset.val+4, ref=offset.ref}, gtatype="float", val=tonumber(value_pack.xarg.y)})
            table.insert(output_table, {offset={val=offset.val+8, ref=offset.ref}, gtatype="float", val=tonumber(value_pack.xarg.z)})
        else
            value = tonumber(value)
            gta = "float"
        end
        table.insert(output_table, {offset=offset, gtatype=gta, val=value})
    end
end

function recursive_look_for_items(meta, alias)
    local valid_items = {}
    for _, item in pairs(meta) do -- each <Item type=...>
        if type(item) == "table" then
            local itemtype = meta.label
            if item.label == "Item" and item.xarg ~= nil and item.xarg.type ~= nil then
                itemtype = item.xarg.type
            end
            if item.label == "Item" and alias[itemtype] ~= nil then
                table.insert(valid_items, {type=itemtype, item=item})
            else
                for _, subitem in pairs(recursive_look_for_items(item, alias)) do
                    table.insert(valid_items, subitem)
                end
            end
        end
    end
    -- tprint(valid_items)
    return valid_items
end

function transform(meta, request_registry)
    -- transform table into efficient lookup
    local alias = {
        CAmmoProjectileInfo="CAmmoInfo",
        CAmmoThrownInfo="CAmmoInfo",
        CAmmoRocketInfo="CAmmoInfo",
        CWeaponComponentClipInfo="CWeaponComponentInfo",
        CWeaponComponentFlashLightInfo="CWeaponComponentInfo",
        CWeaponComponentScopeInfo="CWeaponComponentInfo",
        CWeaponComponentSuppressorInfo="CWeaponComponentInfo",
        CWeaponComponentVariantModelInfo="CWeaponComponentInfo",
        CWeaponComponentReloadData="CWeaponComponentData",
        CWeaponComponentReloadLoopedData="CWeaponComponentData",
        CWeaponSwapData="CWeaponComponentData"
    }
    for itype, _ in pairs(gta_offset_types) do
        alias[itype] = itype -- add default values
    end
    local lookup = {}
    for t, a in pairs(alias) do lookup[a] = {} end
    for _, type_item in pairs(recursive_look_for_items(meta, alias)) do -- each <Item type=...>
        local item_name = nil
        local unaliased = alias[type_item.type]
        local data = {} -- {offset=, gtatype=, val=}
        for _, value_pack in pairs(type_item.item) do -- each <Field>
            if value_pack.label == "Name" or value_pack.label == "name" then
                item_name = value_pack[1] -- e.g. WEAPON_PISTOL
            elseif unaliased == "WeaponGroupDamageForArmouredVehicleGlass" and value_pack.label == "GroupHash" then
                item_name = value_pack[1]
            elseif gta_offset_types[unaliased] ~= nil then
                parse_into_gta_form(gta_offset_types[unaliased], data, request_registry, value_pack, "")
            end
        end
        if unaliased == "WeaponAnimations" and type_item.item.xarg ~= nil then
            item_name = type_item.item.xarg.key
        end
        if item_name == nil then
            log.warning(string.format(
                "Ignored an item of type %s missing <Name> field.", type_item.type))
        else
            data.Name = item_name
            lookup[unaliased][joaat(item_name)] = data
        end
    end
    -- Item infos
    local count = 0
    for itype, items in pairs(lookup) do
        local msg = string.format("Parsed %s items:", itype)
        for _, x in pairs(items) do
            msg = msg..x.Name.." "
            count = count + 1
        end
        log_info(msg)
    end
    log_info(string.format("Parsed %d items into gta form.", count))
    return lookup
end

function register_attachments(xml, track, depth, components, attachment_registry)
    track[depth] = xml.label
    local isouter = false
    if xml.xarg ~= nil and xml.xarg.type == "CWeaponInfo" then
        track[depth] = xml.xarg.type
        isouter = true
    end
    local weapon_name = nil
    local component_name = nil
    local is_default = false
    for _, item in pairs(xml) do
        if isouter and item.label == "Name" then
            weapon_name = item[1]
        end
        if type(item) == "table" then
            if track[2] == "AttachPoints" and track[4] == "Components" then
                if item.label == "Name" then
                    component_name = item[1]
                elseif item.label == "Default" then
                    is_default = item.xarg.value == "true"
                end
            end
            register_attachments(item, track, depth + 1, components, attachment_registry)
        end
    end
    if component_name ~= nil then
        table.insert(components, {Name=component_name, Default=is_default})
    end
    if isouter and weapon_name ~= nil then
        local weapon_hash = joaat(weapon_name)
        for k, item in pairs(components) do
            if attachment_registry[weapon_hash] == nil then
                attachment_registry[weapon_hash] = {Name=weapon_name}
            end
            table.insert(attachment_registry[weapon_hash], item)
            components[k] = nil
        end
    end
    track[depth] = nil
end

--------------------------------- MEMORY PATCHING
function print_offset(offset)
    if offset.ref ~= nil then
        return string.format("0x%x->0x%x", offset.ref, offset.val)
    end
    return string.format("0x%x", offset.val)
end

function restore_patches(patch_registry)
    if patch_registry == nil then return end
    for _, mypatch in ipairs(patch_registry) do
        mypatch.obj:restore()
        log_debug(string.format(
            "[%s] restore %s (pid=%s)",
            mypatch.type, print_offset(mypatch.offset), mypatch.id
        ))
    end
end

function restore_all_patches()
    for _, patch_registry in pairs(memory_patch_registry) do
        restore_patches(patch_registry)
    end
end

function reapply_patches(patch_registry)
    if patch_registry == nil then return end
    for _, mypatch in ipairs(patch_registry) do
        mypatch.obj:apply()
        log_debug(string.format(
            "[%s] apply %s at %s (pid=%s)",
            mypatch.type, mypatch.value, print_offset(mypatch.offset), mypatch.id
        ))
    end
end

memory.pointer.patch_float = function(self, value)
    local f2d = string.unpack("I4", string.pack("f", value))
    return self:patch_dword(f2d)
end

function apply_weapons_meta(script, lookup, looktype, curr_weap, base_addr, request_registry, memory_patch_registry)
    -- GLOBAL: Addresses
    if memory_patch_registry[curr_weap] == nil then
        memory_patch_registry[curr_weap] = {}
        local data = lookup[looktype][curr_weap]
        for k, v in ipairs(data) do
            local wpn_field_addr = base_addr:add(v.offset.val)
            if v.offset.ref ~= nil then
                wpn_field_addr = base_addr:add(v.offset.ref):deref():add(v.offset.val)
            end
            local field_patches = {}
            if v.gtatype == "byte" then
                field_patches[1] = wpn_field_addr:patch_byte(v.val)
            elseif v.gtatype == "word" then
                field_patches[1] = wpn_field_addr:patch_word(v.val)
            elseif v.gtatype == "dword" then
                if request_registry[v.val] ~= nil then
                    handle_request(script, request_registry[v.val])
                end
                field_patches[1] = wpn_field_addr:patch_dword(v.val)
            elseif v.gtatype == "float" then
                field_patches[1] = wpn_field_addr:patch_float(v.val)
            elseif v.gtatype == "qword" then
                field_patches[1] = wpn_field_addr:patch_qword(v.val)
            elseif v.gtatype == "bitset192" then
                local bitset64s = {0, 0, 0}
                local debugmsg = "["..looktype.."][flags] bits="
                for _, b in pairs(v.val) do
                    local q = b // 64 + 1 -- lua 1-indexed
                    local r = b % 64
                    debugmsg = debugmsg..tostring(b).." "
                    bitset64s[q] = bitset64s[q] | (1 << r)
                end
                log_debug(debugmsg)
                for i = 1, 3 do
                    field_patches[i] = wpn_field_addr:add((i-1)*8):patch_qword(bitset64s[i])
                end
            elseif v.gtatype == "bitset32" then
                local bitset = 0
                local debugmsg = "["..looktype.."][flags] bits="
                for _, b in pairs(v.val) do
                    debugmsg = debugmsg..tostring(b).." "
                    bitset = bitset | (1 << b)
                end
                log_debug(debugmsg)
                field_patches[1] = wpn_field_addr:patch_dword(bitset)
            elseif v.gtatype == "ref" then
                local itype = v.val.type
                local hash = v.val.hash
                collect_addresses(itype)
                if Addresses[itype] == nil or Addresses[itype][hash] == nil then
                    log.warning(string.format(
                        "Unkown reference %s (%d) of type %s, skipped.",
                        v.val.name, hash, itype
                    ))
                else
                    field_patches[1] = wpn_field_addr:patch_qword(Addresses[itype][hash])
                end
            end
            for i,p in ipairs(field_patches) do
                local mypatch = {
                    id=tostring(p):gsub("sol.big::lua_patch.:", "0x"):gsub("%s+0*", ""),
                    offset=v.offset,
                    value=tostring(v.val),
                    type=looktype,
                    obj=p
                }
                table.insert(memory_patch_registry[curr_weap], mypatch)
                log_debug(string.format(
                    "[%s] Patch %s at %s",
                    mypatch.type, mypatch.id, print_offset(mypatch.offset)
                ))
            end
        end-- for
    end-- if
    reapply_patches(memory_patch_registry[curr_weap])
end

function apply_all_changes(script)
    -- GLOBAL: lookup, Addresses, request_registry, memory_patch_registry
    for itype, datalist in pairs(lookup) do
        for hash, data in pairs(datalist) do
            collect_addresses(itype)
            if Addresses[itype] == nil or Addresses[itype][hash] == nil then
                log.warning(string.format(
                    "Missing address for item %s (%d) of type %s, skipped.",
                    data.Name, hash, itype
                ))
            else
                local base_addr = memory.pointer.new(Addresses[itype][hash])
                apply_weapons_meta(script, lookup, itype, hash, base_addr, request_registry, memory_patch_registry)
            end
        end
    end
end

--------------------------------- GAMEPLAY
function get_current_weapon()
    if world_addr == nil then world_addr = get_world_addr() end
    local cped = world_addr:add(0x8):deref()
    if cped:is_null() then return 0 end
    local wpn_mgr = cped:add(0x10B8):deref()
    if wpn_mgr:is_null() then return 0 end
    local info = wpn_mgr:add(0x20):deref()
    if info:is_null() then return 0 end
    return info:add(0x10):get_dword()
end

function toggle_attachment(curr_weap, attachment, force_true)
    local playerPed = PLAYER.PLAYER_PED_ID()
    if WEAPON.HAS_PED_GOT_WEAPON_COMPONENT(playerPed, curr_weap, attachment) then
        if not force_true then
            WEAPON.REMOVE_WEAPON_COMPONENT_FROM_PED(playerPed, curr_weap, attachment)
        end
    else
        WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(playerPed, curr_weap, attachment)
    end
end

--------------------------------- REQUESTS
function request_model(script, hash)
    if not STREAMING.IS_MODEL_VALID(hash) then
        return
    end
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do script:yield() end
    log_debug("Loaded model: "..tostring(hash))
end

function request_ptfx(script, name)
    -- if name == "core" then return end -- core might be loaded by default...
    STREAMING.REQUEST_NAMED_PTFX_ASSET(name)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(name) do script:yield() end
    log_debug("Loaded ptfx: "..name)
end

function request_assets(script, name)
    local hash = joaat(name)
    if not WEAPON.IS_WEAPON_VALID(hash) then
        return
    end
    WEAPON.REQUEST_WEAPON_ASSET(hash, 31, 0)
    while not WEAPON.HAS_WEAPON_ASSET_LOADED(hash) do script:yield() end
    log_debug("Loaded assets: "..name)
end

function request_audio(script, name)
    while not AUDIO.REQUEST_SCRIPT_AUDIO_BANK(name, false, 0) do script:yield() end
    log_debug("Loaded audio: "..name)
end

function handle_request(script, info)
    if info.key:find("Fx") ~= nil and gta_ptfx[info.val] ~= nil then
        request_ptfx(script, gta_ptfx[info.val])
    elseif info.key:find("Audio") ~= nil and gta_sfx[info.val] ~= nil then
        request_audio(script, gta_sfx[info.val])
    elseif info.val:find("weapon_") ~= nil then
        request_assets(script, info.val)
    else
        request_model(script, info.hash)
    end
end

function release_all_requests()
    for h, info in ipairs(request_registry) do
        if info.key:find("Fx") ~= nil and gta_ptfx[info.val] ~= nil then
            STREAMING.REMOVE_NAMED_PTFX_ASSET(gta_ptfx[info.val])
            log_debug("Released ptfx: "..info.val)
        elseif info.key:find("Audio") ~= nil and gta_sfx[info.val] ~= nil then
            AUDIO.RELEASE_NAMED_SCRIPT_AUDIO_BANK(gta_sfx[info.val])
            log_debug("Released audio: "..info.val)
        elseif info.val:find("weapon_") ~= nil then
            WEAPON.REMOVE_WEAPON_ASSET(info.hash)
            log_debug("Released weapon: "..info.val)
        elseif STREAMING.IS_MODEL_VALID(info.hash) then
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(info.hash)
            log_debug("Released model: "..info.val)
        end
    end
end
--------------------------------- ADDRESSES
function get_world_addr()
    local world_base = memory.scan_pattern("48 8B 05 ? ? ? ? 45 ? ? ? ? 48 8B 48 08 48 85 C9 74 07")
    if world_base:is_null() then
        log.warning("World address is null! Either the pattern changed or something else is wrong.")
        return nil
    end
    -- local world_offset = world_base:add(3):get_dword()
    -- local world_addr = world_base:add(world_offset + 7)
    local world_addr = world_base:add(3):rip()
    if world_addr:is_null() then
        log.warning("World address is null! Either the pattern changed or something else is wrong.")
        return nil
    end
    return world_addr:deref()
end

function get_at_array_addr(base_addr, offset)
    local at_array_addr = base_addr:add(offset)
    return at_array_addr:deref(), at_array_addr:add(0x8):get_word()
end

function get_fixed_array_addr(base_addr, offset, itemsize, count)
    local at_array_addr = base_addr:add(offset)
    return at_array_addr, at_array_addr:add(itemsize*count):get_word()
end

function traverse_array(array_base, itemcount, is_pointer, itemsize, name_offset, base_offset, output)
    local itemsize = is_pointer and 0x8 or itemsize
    for k=0,itemcount-1 do -- atArray of pointers !
        local info_addr = array_base:add(itemsize*k)
        if is_pointer then info_addr = info_addr:deref() end
        local name_hash = info_addr:add(name_offset):get_dword()
        output[name_hash] = info_addr:add(base_offset):get_address()
    end
end

function collect_addresses(item_type, recollect)
    -- GLOBAL: Addresses
    if Addresses[item_type] ~= nil and not recollect then return end
    local patterns = {
        -- sig-ed from version 3028
        InfoBlob="48 8B 3D ? ? ? ? F3 0F 10 0D ? ? ? ? 45 33 D2",
        ComponentBlob="48 8B 3D ? ? ? ? 4C 8B 04 D7 45 33 C9",
        atAnimationBlob="48 8B 0D ? ? ? ? 48 8D 54 24 ? 89 5C 24 ? E8 ? ? ? ? 84 C0",
        ExplosionBlob="4C 8B 0D ? ? ? ? 44 ? ? 05 ? ? ? ? 48 8D 15",
        FiringBlob="48 8B 1D ? ? ? ? 48 8D 0D ? ? ? ? BA 10 00 00 00"
    }
    for k, p in pairs(patterns) do if Addresses[k] == nil then Addresses[k] = memory.scan_pattern(p):add(3):rip() end end

    local collected = {}
    -- CWeaponInfoBlob
    local info_blob_base, info_blob_count = get_at_array_addr(Addresses.InfoBlob, 0x0)

    if item_type == "CAmmoInfo" then
        collect_addresses("CWeaponInfo")
        collected = Addresses.CWeaponInfo -- shared
    elseif item_type == "CWeaponInfo" then
        for i=0,info_blob_count-1 do
            for j=0,3 do -- 4 lists of info
                local info_array_base, info_count = get_at_array_addr(info_blob_base, 0xf8*i+0x10*j+0x90)
                traverse_array(info_array_base, info_count, true, 0x8, 0x10, 0x0, collected)
            end
        end
    elseif item_type == "TintSpecValues" then
        for i=0,info_blob_count-1 do
            local spec_array_base, spec_count = get_at_array_addr(info_blob_base, 0xf8*i+0x8)
            traverse_array(spec_array_base, spec_count, false, 24, 0x0, 0x0, collected)
        end
    elseif item_type == "FiringPatternAliases" then
        for i=0,info_blob_count-1 do
            local patt_array_base, patt_count = get_at_array_addr(info_blob_base, 0xf8*i+0x18)
            traverse_array(patt_array_base, patt_count, false, 24, 0x0, 0x0, collected)
        end
    elseif item_type == "UpperBodyFixupExpressionData" then
        for i=0,info_blob_count-1 do
            local uppr_array_base, uppr_count = get_at_array_addr(info_blob_base, 0xf8*i+0x28)
            traverse_array(uppr_array_base, uppr_count, false, 52, 0x0, 0x0, collected)
        end
    elseif item_type == "CAimingInfo" then
        for i=0,info_blob_count-1 do
            local info_array_base, info_count = get_at_array_addr(info_blob_base, 0xf8*i+0x38)
            traverse_array(info_array_base, info_count, true, 8, 0x0, 0x0, collected)
        end
    elseif item_type == "CVehicleWeaponInfo" then
        for i=0,info_blob_count-1 do
            local info_array_base, info_count = get_at_array_addr(info_blob_base, 0xf8*i+0x48)
            traverse_array(info_array_base, info_count, true, 8, 0x0, 0x0, collected)
        end
    elseif item_type == "WeaponGroupDamageForArmouredVehicleGlass" then
        for i=0,info_blob_count-1 do
            local glas_array_base, glas_count = get_at_array_addr(info_blob_base, 0xf8*i+0xd0)
            traverse_array(glas_array_base, glas_count, false, 8, 0x0, 0x0, collected)
        end
    elseif item_type == "CWeaponComponentInfo" then
        local comp_blob_base, comp_blob_count = get_at_array_addr(Addresses.ComponentBlob, 0)
        for i=0,comp_blob_count-1 do -- for each blob
            local comp_blob_addr = comp_blob_base:add(0x8*i):deref() -- begin of blob
            local comp_array_base, comp_count = get_fixed_array_addr(comp_blob_addr, 0x10, 8, 460)
            traverse_array(comp_array_base, comp_count, true, 8, 0x10, 0x0, collected)
        end
    elseif item_type == "CWeaponComponentData" then
        local comp_blob_base, comp_blob_count = get_at_array_addr(Addresses.ComponentBlob, 0)
        for i=0,comp_blob_count-1 do -- for each blob
            local comp_blob_addr = comp_blob_base:add(0x8*i):deref() -- begin of blob
            local data_array_base, data_count = get_at_array_addr(comp_blob_addr, 0x0)
            traverse_array(data_array_base, data_count, true, 8, 0x8, 0x0, collected)
        end
    elseif item_type == "CFiringPatternInfo" then
        local firing_base, firing_count = get_at_array_addr(Addresses.FiringBlob, 0)
        traverse_array(firing_base, firing_count, true, 8, 0x10, 0x0, collected)
    elseif item_type == "aExplosionTagData" then
        -- CExplosionInfoManager = atArray<CExplosionTagData>
        local exp_list_base, exp_count = get_at_array_addr(Addresses.ExplosionBlob, 0)
        for i=0,exp_count-1 do
            local exp_base = exp_list_base:add(0x88 * i)
            local name = exp_base:add(0x0):deref():get_string()
            local hash = joaat(exp_base:add(0x0):deref():get_string())
            if collected[hash] == nil then -- ignore 76 ~ 80 EXTINGUISHERs
                collected[hash] = exp_base:get_address()
            end
        end
    elseif item_type == "WeaponAnimations" then
        -- CWeaponAnimationsSets = map<string, struct CWeaponAnimationsSet>
        --       map is 8 bytes + atArray<class{ m_key; 4 bytes; m_value}>
        local set_list_base, set_count = get_at_array_addr(Addresses.atAnimationBlob:deref(), 0x8)
        local anim_apply_set = 26
        local set_entry_base = set_list_base:add(40 * anim_apply_set + 0x8)
        local anim_array_base, anim_count = get_at_array_addr(set_entry_base, 0x10)
        traverse_array(anim_array_base, anim_count, false, 272, 0x0, 0x8, collected)
    end
    Addresses[item_type] = collected
end

--------------------------------- MAIN INIT
function reload_meta()
    -- reset everything
    prev_weapon = 0 -- forces update on meta changed
    attachment_registry = {}

    restore_all_patches()
    release_all_requests()
    memory_patch_registry = {}
    request_registry = {}
    collectgarbage("collect")

    package.loaded.weaponsmeta = nil
    require("weaponsmeta")
    rawxml = collect(weaponsmeta)
    lookup = transform(rawxml, request_registry)
    register_attachments(rawxml, {}, 0, {}, attachment_registry)
    log_info("weaponsmeta.lua reloaded.")
end

curr_weap = 0
Addresses = {}
request_registry = {}
memory_patch_registry = {}
reload_meta()

script.run_in_fiber(function(script)
    world_addr = get_world_addr()
    if enabled then apply_all_changes(script) end
end)

--------------------------------- GUI
myTab:add_imgui(function()
    enabled, Toggled = ImGui.Checkbox("Enabled##weaponeditor", enabled)

    if Toggled then
        if enabled then
            prev_weapon = 0
            script.run_in_fiber(apply_all_changes)
        else
            restore_all_patches()
        end
    end

    ImGui.SameLine()
    if ImGui.Button("Reload meta") then
        reload_meta()
        if enabled then script.run_in_fiber(apply_all_changes) end
    end

    attachmentCB, Toggled2 = ImGui.Checkbox("Default Attachments", attachmentCB)
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip('Auto-equip attachments with <Default value="true" /> in weaponsmeta.lua')
    end

    ImGui.Text("Modded Weapon:")
    if attachment_registry[curr_weap] ~= nil then
        ImGui.SameLine()
        ImGui.Text(attachment_registry[curr_weap].Name)
    end
    if ImGui.BeginListBox("##attachlist", 420, 200) then

        if attachment_registry[curr_weap] ~= nil then
            for i, pack in ipairs(attachment_registry[curr_weap]) do
                if ImGui.Selectable(pack.Name) then
                    toggle_attachment(curr_weap, joaat(pack.Name))
                end
            end
        else
            ImGui.Selectable("Current weapon has 0 modded attachments.")
        end

        ImGui.EndListBox()
    end
end)

script.register_looped("weaponloop", function (sc)
    sc:yield()
    -- on weapon changed
    curr_weap = get_current_weapon()
    if curr_weap ~= 0 and curr_weap ~= prev_weapon then
        prev_weapon = curr_weap

        if not enabled then
            goto skipapply
        end
        -- apply default components
        if attachmentCB and attachment_registry[curr_weap] ~= nil then
            for i, pack in ipairs(attachment_registry[curr_weap]) do
                if pack.Default then
                    toggle_attachment(curr_weap, joaat(pack.Name), true)
                end
            end
        end
    end
    ::skipapply::
end)

