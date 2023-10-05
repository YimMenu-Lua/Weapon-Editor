# Usage

## Basics
The file `weaponsmeta.lua` contains a multiline string:
```lua
weaponsmeta = [[
<Item type="CWeaponInfo">
...
]]
```
All you need is to put modded items in the string. The mod will load on start or when you press `Reload meta`. The following item types share the same syntax:
```xml
<Item type="TypeName">
  <Name>ITEM_NAME</Name>
  ...
</Item>
```
|  TypeName | Example File (OpenIV) |
| -------- | -|
| CWeaponInfo<br>CAmmoInfo<br>CAmmoProjectileInfo<br>CAmmoThrownInfo<br>CAmmoRocketInfo<br>CAimingInfo<br>CVehicleWeaponInfo | common.rpf/data/ai/weapons.meta |
| CWeaponComponentData<br>CWeaponSwapData<br>CWeaponComponentReloadData<br>CWeaponComponentReloadLoopedData<br>CWeaponComponentInfo<br>CWeaponComponentClipInfo<br>CWeaponComponentFlashLightInfo<br>CWeaponComponentScopeInfo<br>CWeaponComponentSuppressorInfo<br>CWeaponComponentVariantModelInfo<br> | common.rpf/data/ai/weaponcomponents.meta |
|CFiringPatternInfo| https://pastebin.com/Px036isB |

These and their supported fields are listed in `lib/gtaoffsets`. Checkout this [tutorial](https://forums.gta5-mods.com/topic/36832/tutorial-basic-editing-of-weapons-meta) for basic editing of CWeaponInfo, and see the included `weaponsmeta.lua` for concrete example.

You don't need to put the entire Item into `weaponsmeta`. Simply include the modified fields and values. Except when the field is listed `"*array"` and `"flag*"` type inside `lib/gtaoffsets`, such as  `<AttachPoints>` and `<WeaponFlags>`. These types require the entire list to be overritten, so you need to include the complete values you want.

## Enums
For enumeration (e.g. `<Explosion>`) and flag types (e.g. `<ProjectileFlags>`), you can refer to `lib/gtaenums.lua` for lists of valid values.

## AmmoInfo
Changes on ammo are shared among weapons that use said ammo. For instance, if I put the following, then **all pistols** will be have hollow point.
```xml
<Item type="CAmmoInfo">
  <Name>AMMO_PISTOL</Name>
  <AmmoSpecialType>HollowPoint</AmmoSpecialType>
</Item>
```
Meanwhile you can change the ammo type of a weapon:
```xml
<Item type="CWeaponInfo">
  <Name>WEAPON_APPISTOL</Name>
  <AmmoInfo ref="AMMO_SNIPER_EXPLOSIVE" />
</Item>
```

## Aiming Angle
Aim vertically like flaregun:
```xml
<Item type="CAimingInfo">
  <Name>MINIGUN</Name>
  <SweepPitchMax value="80.000000" />
</Item>
```
Alternatively, just change AimingInfo to flaregun:
```xml
<Item type="CWeaponInfo">
  <Name>WEAPON_MINIGUN</Name>
  <AimingInfo ref="PISTOL_FLAREGUN_BASE_STRAFE" />
</Item>
```

## Model and Audio
You can change the weapon model or audio like this:
```xml
<Item type="CWeaponInfo">
  <Name>WEAPON_PISTOL_MK2</Name>
  <Model>W_PI_COMBATPISTOL</Model>
  <Audio>AUDIO_ITEM_PISTOL_XM3</Audio>
</Item>
```
- For audio, you might need to swap weapon and back before the sound is applied.
- For model, replacing similar guns works fine. However, sometimes the new model might be misaligned or outright won't appear.

## Effects
Effects such as muzzle/shell/tracer, and projectile's fuse/trail can all be changed:
```xml
<Item type="CWeaponInfo">
  <Name>WEAPON_PISTOL</Name>
  <Fx>
    <FlashFx>muz_ch_tank_laser</FlashFx>
    <ShellFx>eject_sniper_heavy</ShellFx>
    <TracerFx>bullet_tracer_ch_tank_laser</TracerFx>
    <GroundDisturbFxNameDefault>weap_hvy_turbulance_default</GroundDisturbFxNameDefault>
  </Fx>
</Item>
<Item type="CAmmoProjectileInfo">
  <Name>AMMO_RPG</Name>
  <FuseFx />
  <TrailFx>proj_xm_thruster_rpg_trail</TrailFx>
  <PrimedFx />
  <DisturbFxDefault>proj_disturb_dust</DisturbFxDefault>
</Item>
```
- The supported effects are listed in `lib/gtaenums.lua` (under gta_ptfx).
- You can add other particle effects from https://github.com/DurtyFree/gta-v-data-dumps/blob/master/particleEffectsCompact.json.
- Make sure to add a new `EffectName="DictionaryName"` entry to gta_ptfx, so the new fx can be loaded.

## Attachments
You can add attachments to different guns by the following steps
1. Add an `<Item>` to a desired bone in `<AttachPoints>`. For example the following adds `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE` to `WAPClip`:
```xml
<Item type="CWeaponInfo">
  <Name>WEAPON_PRECISIONRIFLE</Name>
  <AttachPoints>
    <Item>
      <AttachBone>WAPClip</AttachBone>
      <Components>
        <Item>
          <Name>COMPONENT_PRECISIONRIFLE_CLIP_01</Name>
          <Default value="true" />
        </Item>
        <Item>
          <Name>COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE</Name>
          <Default value="false" />
        </Item>
      </Components>
    </Item>
  </AttachPoints>
</Item>
```
2. Go in-game and equip the target weapon.
3. Open Yimmenu -> Weapon Editor page.
4. Set `Enabled` and press `Reload meta` to reload changes.
5. Now all modded attachments should appear in the box.
6. Click on an attachment to equip / remove it.
7. You could set `<Default value="true" />`, and tick `Default Attachments` in the menu. This will auto-equip default attachments for you upon weapon switch.

Don't change the order of `<AttachBone>bone_name</AttachBone>` from the original CWeaponInfo of a weapon. The game uses a fixed order from it, so if you use anything different, the attachments will appear in the wrong position. It's best to simply add `<Item>` to a desired existing bone.

**Don't go beyond 12 components per bone**, it leads to undefined behaviour.

For example, you can add new scopes for any weapon with `<AttachBone>WAPScop</AttachBone>` or `WAPScop_2` in their CWeaponInfo, like so:
```xml
<Item>
  <AttachBone>WAPScop</AttachBone>
  <Components>
    <Item>
      <Name>COMPONENT_AT_SIGHTS</Name>
      <Default value="true" />
    </Item>
    <Item>
      <Name>COMPONENT_AT_SCOPE_SMALL_MK2</Name>
      <Default value="false" />
    </Item>
    <Item>
      <Name>COMPONENT_AT_SCOPE_MACRO_MK2</Name>
      <Default value="false" />
    </Item>
    <Item>
      <Name>COMPONENT_AT_SCOPE_MEDIUM_MK2</Name>
      <Default value="false" />
    </Item>
    <Item>
      <Name>COMPONENT_AT_SCOPE_NV</Name>
      <Default value="false" />
    </Item>
    <Item>
      <Name>COMPONENT_AT_SCOPE_THERMAL</Name>
      <Default value="false" />
    </Item>
  </Components>
</Item>
```
Here are more components: https://wiki.rage.mp/index.php?title=Weapons_Components

## Attachments Modifications
You can further modify the behavior of each type of attachment:
```xml
<Item type="CWeaponComponentClipInfo">
  <Name>COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE</Name>
  <ClipSize value="16" />
</Item>
<Item type="CWeaponComponentScopeInfo">
  <Name>COMPONENT_AT_SCOPE_MAX</Name>
  <SpecialScopeType>ThermalVision</SpecialScopeType>
</Item>
```

## Advanced Types
The following item types alternative syntax:
```xml
<TypeName>
  <Item>
    <Name>ITEM_NAME</Name>
    ...
  </Item>
</TypeName>
```
|  TypeName | Example File (OpenIV) |
| -------- | -|
| TintSpecValues<br>FiringPatternAliases<br>UpperBodyFixupExpressionData<br>WeaponGroupDamageForArmouredVehicleGlass<br> | common.rpf/data/ai/weapons.meta |
|WeaponAnimations|common.rpf/data/ai/weaponanimations.meta  |
|aExplosionTagData|https://gist.github.com/George0828Zhang/e9b310a124f0c97b3f0ee254c7739d04  |

- These types are NOT arrays (though they may contain arrays), so you can put one or more `<Item>`'s that you want to edit inside the `<TypeName>` clause.
- `TintSpecValues`, `UpperBodyFixupExpressionData` and `WeaponGroupDamageForArmouredVehicleGlass` contain array members, so when editing the array members, do include all original items under the array members. (Confusing I know)

## Explosion Tag
To modify a specific type of explosion, do this:
```xml
<aExplosionTagData>
  <Item>
    <name>EXP_TAG_BALANCED_CANNONS</name>
    <camShakeName />
    <vfxTagHashName>EXP_VFXTAG_PIPEBOMB</vfxTagHashName>
    <fragDamage value="1500.000000" />
    <bUseDistanceDamageCalc value="false" />
  </Item>
</aExplosionTagData>
```

## Animations
Animations is a bit buggy. Each ped use a different anim set. This mod currently only apply to `Default` animation set. You could manually change the `anim_apply_set` variable to the index of desired set found in `lib/gtaenums.lua` (under gta_anim_set_keys).
```xml
<WeaponAnimations>
  <Item key="WEAPON_COMBATPISTOL">
    <AnimFireRateModifier value="2.000000" />
    <AnimBlindFireRateModifier value="2.000000" />
    <AnimWantingToShootFireRateModifier value="3.000000" />
  </Item>
</WeaponAnimations>
```
## Limitations
### Conflicts

|  weaponsmeta field    | Yimmenu Weapons option |Behaviour|
| -------- | ------- |-|
| Explosion, AmmoSpecialType |   Enable Special Ammo  |Undefined|
| WeaponRange |  Infinite Range |Undefined|
| RecoilShakeAmplitude |  No Recoil |Undefined|
| AccuracySpread |  No Spread|Undefined|
| Damage, *DamageModifier |  Damage Override|Yimmenu overrides WeaponEditor|
| Vehicle related Infos |  Vehicle>Fun>Custom Vehicle Weapons|Undefined|
- Undefined means two options will try to set value on the same field, and they might fail to restore the value when toggled off.
- Rule of thumb: If you want global effect on all weapons -> go with Yimmenu options. WeaponEditor is for finetuning each gun.

### Network Visibility
In general, the changes wont sync to others online. Known sync values:
- Damage, AccuracySpread, AmmoSpecialType etc. (anything involving damage)
- Explosion (close range)

Known issues:
- If your homing rocket uses EMP explosion, but the homing target is far away, then rocket explosion might revert to regular, killing the target.
- If you change projectile model, on your end it applies to other players/peds. e.g. Use chernobog missile for homing rockets, then other players' homing launcher will launch chernobog missiles on your screen. But both yours and their rockets appear normal to them.
- Ptfx (e.g. FlashFx) does not sync.

## Extension
Potentially this could extend to e.g. CHandlingData, or anything whose InfoBlob/Manager offset and Item Template is known. Start from looking into class dumps: https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3028&search=cweaponin#CWeaponInfo