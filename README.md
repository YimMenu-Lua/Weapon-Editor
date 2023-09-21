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

## Credits & Reference
- [Yimmenu](https://github.com/YimMenu/YimMenu)
- [xmlreader](http://lua-users.org/wiki/LuaXml)
- [worldpointer](https://www.unknowncheats.me/forum/grand-theft-auto-v/496174-worldptr.html)
- [NativeDB](https://alloc8or.re/gta5/nativedb/)
- [GTAV-Classes](https://github.com/Yimura/GTAV-Classes)
- [rage-parser-dumps](https://alexguirre.github.io/rage-parser-dumps/)
- [gta-v-data-dumps](https://github.com/DurtyFree/gta-v-data-dumps/)
