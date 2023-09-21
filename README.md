# Weapon-Editor
WeaponEditor is a lua script that lets you mod `weapons.meta` externally while the game is running. You can mod weapon behaviour, add attachments etc. without actually changing the game files.

## Install
Put the files under `%AppData%\Roaming\YimMenu\scripts`
```
scripts/
├── lib/
│   ├── xmlreader.lua
│   ├── gtaenums.lua
│   └── gtaoffsets.lua
├── WeaponEditor.lua
└── weaponsmeta.lua
```

## How to [Use](docs/Usage.md)

## Example
The included `weaponsmeta.lua` offers the following modifications.
- Increased damage, range and homing with great tracking for the RPG.
- Explosive clip and scopes for Precision Rifle.
- Explosive slugs for Heavy Shotgun.
- Smoke grenade and scopes for Grenade Launcher.
- Extended zoom and original railgun explosion for the online Railgun.
- EMPLauncher shoots sticky gold bars that can be detonated.
- WM29 pistol sound for Pistol MK2.
- Blue Jerry can.
- Extended clip, scope and suppressor for micro SMG.
- Box mag for Carbine MK2, SpecialCarbine MK2 and Service Carbine.
- Drum mag for Carbine MK2, SpecialCarbine MK2, Heavy Rifle, Marksman Rifle MK2.
- Extended scopes / red dot sight for Carbine Rifle.
- Reload speed 1.5x for all weapons.
- MK2 grips for most weapons.
- ArmourPenetrating=true for most weapons.

## Limitations
### Conflicts

|  weaponsmeta field    | Yimmenu Weapons option |Behaviour|
| -------- | ------- |-|
| Explosion, AmmoSpecialType |   Enable Special Ammo  |Undefined|
| WeaponRange |  Infinite Range |Undefined|
| RecoilShakeAmplitude |  No Recoil |Undefined|
| AccuracySpread |  No Spread|Undefined|
| Damage, *DamageModifier |  Damage Override|Yimmenu overrides WeaponEditor|
| fields of VEHICLE_WEAPON_* |  Vehicle>Fun>Custom Vehicle Weapons|Undefined|
- Undefined means two options will try to set value on the same field, and they might fail to restore the value when toggled off.
- Rule of thumb: If you want global effect on all weapons -> go with Yimmenu options. WeaponEditor is for finetuning each gun.

### Network Visibility
In general it is unkwown how the changes appear to others online. Known issues:
- If your rocket uses EMP explosion, but the homing target is far away, then rocket explosion might revert to regular, killing the target. Doesn't happen when target is close.
- If you change projectile model, on your end it applies to other players/peds. e.g. Use chernobog missile for homing rockets, then other players' homing launcher will launch chernobog missiles.
    - It is unknown how it looks on their end though.

### Attachment Stats, Animations, Custom Ammo
- The attachment behaviour, such as clip size, can't be changed.
- Animations can't be changed.
- You cannot invent new ammo types.

## Credits & Reference
- [Yimmenu](https://github.com/YimMenu/YimMenu)
- [xmlreader](http://lua-users.org/wiki/LuaXml)
- [worldpointer](https://www.unknowncheats.me/forum/grand-theft-auto-v/496174-worldptr.html)
- [NativeDB](https://alloc8or.re/gta5/nativedb/)
- [GTAV-Classes](https://github.com/Yimura/GTAV-Classes)
- [rage-parser-dumps](https://alexguirre.github.io/rage-parser-dumps/)
- [gta-v-data-dumps](https://github.com/DurtyFree/gta-v-data-dumps/)
