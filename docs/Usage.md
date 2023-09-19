# Usage

## Basics
The file `weaponsmeta.lua` contains a multiline string:
```lua
weaponsmeta = [[
<Item type="CWeaponInfo">
  ...
</Item>
<Item type="CAmmoInfo">
  ...
</Item>
...
]]
```
All you need is to put modded items in the string. The mod will load on start or when you press `Reload meta`.

Currently supported item types are:
```
CWeaponInfo
CAmmoInfo
CAmmoProjectileInfo
CAmmoThrownInfo
CAmmoRocketInfo
```
and the supported fields are listed in `lib/gtaoffsets`. Checkout this [tutorial](https://forums.gta5-mods.com/topic/36832/tutorial-basic-editing-of-weapons-meta) for basics, and see the included `weaponsmeta.lua` for concrete example.

You don't need the complete Infos in `weapons.meta`. Just put the modified fields and values. Two exceptions to this are `<AttachPoints>` and `<WeaponFlags>`, for them you need to include the complete list of values.


## Enums
For enumeration (e.g. `<Explosion>`) and flag types (e.g. `<ProjectileFlags>`), you can refer to `lib/gtaenums.lua` for lists of valid values.

## AmmoInfo
In the current state, changes on ammo are shared among weapons that use said ammo. For instance, if I put the following, then **all pistols** will be have hollow point.
```xml
<Item type="CAmmoInfo">
  <Name>AMMO_PISTOL</Name>
  <AmmoSpecialType>HollowPoint</AmmoSpecialType>
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