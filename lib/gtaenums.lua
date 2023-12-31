-- Author: George Chang (George0828Zhang)
-- Credits:
-- https://github.com/Yimura/GTAV-Classes
-- https://alexguirre.github.io/rage-parser-dumps/
-- https://github.com/DurtyFree/gta-v-data-dumps/

gta_enums = {
    WheelSlot = {
        WHEEL_PISTOL = 0,
        WHEEL_SMG = 1,
        WHEEL_RIFLE = 2,
        WHEEL_SNIPER = 3,
        WHEEL_UNARMED_MELEE = 4,
        WHEEL_SHOTGUN = 5,
        WHEEL_HEAVY = 6,
        WHEEL_THROWABLE_SPECIAL = 7,
    },
    DamageType = {
        UNKNOWN = 0,
        NONE = 1,
        MELEE = 2,
        BULLET = 3,
        BULLET_RUBBER = 4,
        EXPLOSIVE = 5,
        FIRE = 6,
        COLLISION = 7,
        FALL = 8,
        DROWN = 9,
        ELECTRIC = 10,
        BARBED_WIRE = 11,
        FIRE_EXTINGUISHER = 12,
        SMOKE = 13,
        WATER_CANNON = 14,
        TRANQUILIZER = 15
    },
    Explosion = {
        DONTCARE = -1,
        GRENADE = 0,
        GRENADELAUNCHER = 1,
        STICKYBOMB = 2,
        MOLOTOV = 3,
        ROCKET = 4,
        TANKSHELL = 5,
        HI_OCTANE = 6,
        CAR = 7,
        PLANE = 8,
        PETROL_PUMP = 9,
        BIKE = 10,
        DIR_STEAM = 11,
        DIR_FLAME = 12,
        DIR_WATER_HYDRANT = 13,
        DIR_GAS_CANISTER = 14,
        BOAT = 15,
        SHIP_DESTROY = 16,
        TRUCK = 17,
        BULLET = 18,
        SMOKEGRENADELAUNCHER = 19,
        SMOKEGRENADE = 20,
        BZGAS = 21,
        FLARE = 22,
        GAS_CANISTER = 23,
        EXTINGUISHER = 24,
        PROGRAMMABLEAR = 25,
        TRAIN = 26,
        BARREL = 27,
        PROPANE = 28,
        BLIMP = 29,
        DIR_FLAME_EXPLODE = 30,
        TANKER = 31,
        PLANE_ROCKET = 32,
        VEHICLE_BULLET = 33,
        GAS_TANK = 34,
        BIRD_CRAP = 35,
        RAILGUN = 36,
        BLIMP2 = 37,
        FIREWORK = 38,
        SNOWBALL = 39,
        PROXMINE = 40,
        VALKYRIE_CANNON = 41,
        AIR_DEFENSE = 42,
        PIPEBOMB = 43,
        VEHICLEMINE = 44,
        EXPLOSIVEAMMO = 45,
        APCSHELL = 46,
        BOMB_CLUSTER = 47,
        BOMB_GAS = 48,
        BOMB_INCENDIARY = 49,
        BOMB_STANDARD = 50,
        TORPEDO = 51,
        TORPEDO_UNDERWATER = 52,
        BOMBUSHKA_CANNON = 53,
        BOMB_CLUSTER_SECONDARY = 54,
        HUNTER_BARRAGE = 55,
        HUNTER_CANNON = 56,
        ROGUE_CANNON = 57,
        MINE_UNDERWATER = 58,
        ORBITAL_CANNON = 59,
        BOMB_STANDARD_WIDE = 60,
        EXPLOSIVEAMMO_SHOTGUN = 61,
        OPPRESSOR2_CANNON = 62,
        MORTAR_KINETIC = 63,
        VEHICLEMINE_KINETIC = 64,
        VEHICLEMINE_EMP = 65,
        VEHICLEMINE_SPIKE = 66,
        VEHICLEMINE_SLICK = 67,
        VEHICLEMINE_TAR = 68,
        SCRIPT_DRONE = 69,
        RAYGUN = 70,
        BURIEDMINE = 71,
        SCRIPT_MISSILE = 72,
        RCTANK_ROCKET = 73,
        BOMB_WATER = 74,
        BOMB_WATER_SECONDARY = 75,
        -- 76 ~ 80 are exactly the same as EXTINGUISHER = 24,
        -- EXTINGUISHER2 = 76,
        -- EXTINGUISHER3 = 77,
        -- EXTINGUISHER4 = 78,
        -- EXTINGUISHER5 = 79,
        -- EXTINGUISHER6 = 80,
        SCRIPT_MISSILE_LARGE = 81,
        SUBMARINE_BIG = 82,
        EMPLAUNCHER_EMP = 83,
        RAILGUNXM3 = 84,
        BALANCED_CANNONS = 85
    },
    FireType = {
        NONE = 0,
        MELEE = 1,
        INSTANT_HIT = 2,
        DELAYED_HIT = 3,
        PROJECTILE = 4,
        VOLUMETRIC_PARTICLE = 5
    },
    WeaponFlags = {
        CarriedInHand = 0,
        Automatic = 1,
        Silenced = 2,
        FirstPersonScope = 3,
        ArmourPenetrating = 4,
        ApplyBulletForce = 5,
        Gun = 6,
        CanLockonOnFoot = 7,
        CanLockonInVehicle = 8,
        Homing = 9,
        CanFreeAim = 10,
        Heavy = 11,
        TwoHanded = 12,
        Launched = 13,
        MeleeBlade = 14,
        MeleeClub = 15,
        AnimReload = 16,
        AnimCrouchFire = 17,
        CreateVisibleOrdnance = 18,
        TreatAsOneHandedInCover = 19,
        TreatAsTwoHandedInCover = 20,
        Thrown = 21,
        Bomb = 22,
        UsableOnFoot = 23,
        UsableUnderwater = 24,
        UsableClimbing = 25,
        UsableInCover = 26,
        AllowEarlyExitFromFireAnimAfterBulletFired = 27,
        DisableRightHandIk = 28,
        DisableLeftHandIkInCover = 29,
        DontSwapWeaponIfNoAmmo = 30,
        UseLoopedReloadAnim = 31,
        DoesRevivableDamage = 32,
        NoFriendlyFireDamage = 33,
        Detonator = 34,
        DisplayRechargeTimeHUD = 35,
        OnlyFireOneShot = 36,
        OnlyFireOneShotPerTriggerPress = 37,
        UseLegDamageVoice = 38,
        Lasso = 39,
        CanBeFiredLikeGun = 40,
        OnlyAllowFiring = 41,
        NoLeftHandIK = 42,
        NoLeftHandIKWhenBlocked = 43,
        RiotShield = 44,
        IgnoreStrafing = 45,
        Vehicle = 46,
        EnforceAimingRestrictions = 47,
        ForceEjectShellAfterFiring = 48,
        NonViolent = 49,
        NonLethal = 50,
        Scary = 51,
        AllowCloseQuarterKills = 52,
        DisablePlayerBlockingInMP = 53,
        StaticReticulePosition = 54,
        CanPerformArrest = 55,
        _0xF1DA2249 = 56,
        AllowMeleeIntroAnim = 57,
        ManualDetonation = 58,
        SuppressGunshotEvent = 59,
        HiddenFromWeaponWheel = 60,
        AllowDriverLockOnToAmbientPeds = 61,
        NeedsGunCockingInCover = 62,
        ThrowOnly = 63,
        NoAutoRunWhenFiring = 64,
        DisableIdleVariations = 65,
        HasLowCoverReloads = 66,
        HasLowCoverSwaps = 67,
        DontBreakRopes = 68,
        CookWhileAiming = 69,
        UseLeftHandIkWhenAiming = 70,
        DropWhenCooked = 71,
        NotAWeapon = 72,
        RemoveEarlyWhenEnteringVehicles = 73,
        DontBlendFireOutro = 74,
        DiscardWhenOutOfAmmo = 75,
        DelayedFiringAfterAutoSwap = 76,
        EnforceFiringAngularThreshold = 77,
        ForcesActionMode = 78,
        CreatesAPotentialExplosionEventWhenFired = 79,
        CreateBulletExplosionWhenOutOfTime = 80,
        DelayedFiringAfterAutoSwapPreviousWeapon = 81,
        DisableCombatRoll = 82,
        NoWheelStats = 83,
        ProcessGripAnim = 84,
        DisableStealth = 85,
        DangerousLookingMeleeWeapon = 86,
        QuitTransitionToIdleIntroOnWeaponChange = 87,
        DisableLeftHandIkWhenOnFoot = 88,
        IgnoreHelmets = 89,
        Rpg = 90,
        NoAmmoDisplay = 91,
        TorsoIKForWeaponBlock = 92,
        LongWeapon = 93,
        UsableUnderwaterOnly = 94,
        _0xE3C63C3B = 95,
        _0x1E3D23FF = 96,
        AssistedAimVehicleWeapon = 97,
        CanBlowUpVehicleAtZeroBodyHealth = 98,
        IgnoreAnimReloadRateModifiers = 99,
        DisableIdleAnimationFilter = 100,
        PenetrateVehicles = 101,
        _0xBDBBC7FE = 102,
        HomingToggle = 103,
        ApplyVehicleDamageToEngine = 104,
        Turret = 105,
        DisableAimAngleChecksForReticule = 106,
        AllowMovementDuringFirstPersonScope = 107,
        DriveByMPOnly = 108,
        PlacedOnly = 109,
        CreateWeaponWithNoModel = 110,
        RemoveWhenUnequipped = 111,
        BlockAmbientIdles = 112,
        NotUnarmed = 113,
        UseFPSAimIK = 114,
        DisableFPSScope = 115,
        DisableFPSAimForScope = 116,
        EnableFPSRNGOnly = 117,
        EnableFPSIdleOnly = 118,
        MeleeHatchet = 119,
        UseAlternateFPDrivebyClipset = 120,
        AttachFPSLeftHandIKToRight = 121,
        OnlyUseAimingInfoInFPS = 122,
        UseFPSAnimatedRecoil = 123,
        UseFPSSecondaryMotion = 124,
        HasFPSProjectileWeaponAnims = 125,
        AllowMeleeBlock = 126,
        DontPlayDryFireAnim = 127,
        SwapToUnarmedWhenOutOfThrownAmmo = 128,
        PlayOutOfAmmoAnim = 129,
        DisableIdleAnimationFilterWhenReloading = 130,
        OnFootHoming = 131,
        DamageCausesDisputes = 132,
        UsePlaneExplosionDamageCapInMP = 133,
        FPSOnlyExitFireAnimAfterRecoilEnds = 134,
        SkipVehiclePetrolTankDamage = 135,
        DontAutoSwapOnPickUp = 136,
        DisableTorsoIKAboveAngleThreshold = 137,
        MeleeFist = 138,
        NotAllowedForDriveby = 139,
        AttachReloadObjectToRightHand = 140,
        CanBeAimedLikeGunWithoutFiring = 141,
        MeleeMachete = 142,
        HideReticule = 143,
        UseHolsterAnimation = 144,
        BlockFirstPersonStateTransitionWhileFiring = 145,
        ForceFullFireAnimation = 146,
        DisableLeftHandIkInDriveby = 147,
        CanUseInVehMelee = 148,
        UseVehicleWeaponBoneForward = 149,
        UseManualTargetingMode = 150,
        IgnoreTracerVfxMuzzleDirectionCheck = 151,
        IgnoreHomingCloseThresholdCheck = 152,
        LockOnRequiresAim = 153,
        DisableCameraPullAround = 154,
        VehicleChargedLaunch = 155,
        ForcePedAsFiringEntity = 156,
        FiringEntityIgnoresExplosionDamage = 157,
        IdlePhaseBasedOnTrigger = 158,
        HighSpinRate = 159,
        EnabledOnlyWhenVehTransformed = 160,
        IncendiaryGuaranteedChance = 161,
        UseCameraHeadingForHomingTargetCheck = 162,
        UseWeaponRangeForTargetProbe = 163,
        SkipProjectileLOSCheck = 164,
        UseRevolverBehaviour = 165,
        UseSingleActionBehaviour = 166,
        PairedWeaponHolsterAnimation = 167,
        UseInstantAnimBlendFromIdleToFire = 168,
        UseInstantAnimBlendFromFireToIdle = 169,
        _0x53D0CED3 = 170,
        FireAnimRateScaledToTimeBetweenShots = 171,
        _0xC2A180AE = 172,
        _0xC03C4B08 = 173,
        _0x7CACFF1F = 174,
        BoatWeaponIsNotSearchLight = 175,
        AllowFireInterruptWhenReady = 176,
        ResponsiveRecoilRecovery = 177,
        OnlyLockOnToAquaticVehicles = 178
    },
    AmmoSpecialType = {
        None = 0,
        ArmorPiercing = 1,
        Explosive = 2,
        FMJ = 3,
        HollowPoint = 4,
        Incendiary = 5,
        Tracer = 6
    },
    EffectGroup = {
        WEAPON_EFFECT_GROUP_PUNCH_KICK = 0,
        WEAPON_EFFECT_GROUP_MELEE_WOOD = 1,
        WEAPON_EFFECT_GROUP_MELEE_METAL = 2,
        WEAPON_EFFECT_GROUP_MELEE_SHARP = 3,
        WEAPON_EFFECT_GROUP_MELEE_GENERIC = 4,
        WEAPON_EFFECT_GROUP_PISTOL_SMALL = 5,
        WEAPON_EFFECT_GROUP_PISTOL_LARGE = 6,
        WEAPON_EFFECT_GROUP_PISTOL_SILENCED = 7,
        WEAPON_EFFECT_GROUP_RUBBER = 8,
        WEAPON_EFFECT_GROUP_SMG = 9,
        WEAPON_EFFECT_GROUP_SHOTGUN = 10,
        WEAPON_EFFECT_GROUP_RIFLE_ASSAULT = 11,
        WEAPON_EFFECT_GROUP_RIFLE_SNIPER = 12,
        WEAPON_EFFECT_GROUP_ROCKET = 13,
        WEAPON_EFFECT_GROUP_GRENADE = 14,
        WEAPON_EFFECT_GROUP_MOLOTOV = 15,
        WEAPON_EFFECT_GROUP_FIRE = 16,
        WEAPON_EFFECT_GROUP_EXPLOSION = 17,
        WEAPON_EFFECT_GROUP_LASER = 18,
        WEAPON_EFFECT_GROUP_STUNGUN = 19,
        WEAPON_EFFECT_GROUP_HEAVY_MG = 20,
        WEAPON_EFFECT_GROUP_VEHICLE_MG = 21
    },
    AmmoFlags = {
        InfiniteAmmo = 0,
        AddSmokeOnExplosion = 1,
        Fuse = 2,
        FixedAfterExplosion = 3
    },
    ProjectileFlags = {
        Sticky = 0,
        DestroyOnImpact = 1,
        ProcessImpacts = 2,
        HideDrawable = 3,
        TrailFxInactiveOnceWet = 4,
        TrailFxRemovedOnImpact = 5,
        DoGroundDisturbanceFx = 6,
        CanBePlaced = 7,
        NoPullPin = 8,
        DelayUntilSettled = 9,
        CanBeDestroyedByDamage = 10,
        CanBounce = 11,
        DoubleDamping = 12,
        StickToPeds = 13,
        H_0x2E3F9CBA = 14,
        ThrustUnderwater = 15,
        ApplyDamageOnImpact = 16,
        SetOnFireOnImpact = 17,
        DontFireAnyEvents = 18,
        AlignWithTrajectory = 19,
        ExplodeAtTrailFxPos = 20,
        ProximityDetonation = 21,
        AlignWithTrajectoryYAxis = 22,
        HomingAttractor = 23,
        Cluster = 24,
        PreventMaxProjectileHelpText = 25,
        _0x8A7D429C = 26,
        UseGravityOutOfWater = 27,
        MissionThrowable = 28
    },
    BoneTag = {
        BONETAG_INVALID = -1,
        BONETAG_ROOT = 0,
        BONETAG_PELVISROOT = 17916,
        BONETAG_PELVIS = 11816,
        BONETAG_PELVIS1 = 53251,
        BONETAG_SPINE_ROOT = 57597,
        BONETAG_SPINE0 = 23553,
        BONETAG_SPINE1 = 24816,
        BONETAG_SPINE2 = 24817,
        BONETAG_SPINE3 = 24818,
        BONETAG_NECK = 39317,
        BONETAG_NECK2 = 24532,
        BONETAG_HEAD = 31086,
        BONETAG_R_CLAVICLE = 10706,
        BONETAG_R_UPPERARM = 40269,
        BONETAG_R_FOREARM = 28252,
        BONETAG_R_HAND = 57005,
        BONETAG_R_FINGER0 = 58866,
        BONETAG_R_FINGER01 = 64016,
        BONETAG_R_FINGER02 = 64017,
        BONETAG_R_FINGER1 = 58867,
        BONETAG_R_FINGER11 = 64096,
        BONETAG_R_FINGER12 = 64097,
        BONETAG_R_FINGER2 = 58868,
        BONETAG_R_FINGER21 = 64112,
        BONETAG_R_FINGER22 = 64113,
        BONETAG_R_FINGER3 = 58869,
        BONETAG_R_FINGER31 = 64064,
        BONETAG_R_FINGER32 = 64065,
        BONETAG_R_FINGER4 = 58870,
        BONETAG_R_FINGER41 = 64080,
        BONETAG_R_FINGER42 = 64081,
        BONETAG_L_CLAVICLE = 64729,
        BONETAG_L_UPPERARM = 45509,
        BONETAG_L_FOREARM = 61163,
        BONETAG_L_HAND = 18905,
        BONETAG_L_FINGER0 = 26610,
        BONETAG_L_FINGER01 = 4089,
        BONETAG_L_FINGER02 = 4090,
        BONETAG_L_FINGER1 = 26611,
        BONETAG_L_FINGER11 = 4169,
        BONETAG_L_FINGER12 = 4170,
        BONETAG_L_FINGER2 = 26612,
        BONETAG_L_FINGER21 = 4185,
        BONETAG_L_FINGER22 = 4186,
        BONETAG_L_FINGER3 = 26613,
        BONETAG_L_FINGER31 = 4137,
        BONETAG_L_FINGER32 = 4138,
        BONETAG_L_FINGER4 = 26614,
        BONETAG_L_FINGER41 = 4153,
        BONETAG_L_FINGER42 = 4154,
        BONETAG_L_THIGH = 58271,
        BONETAG_L_CALF = 63931,
        BONETAG_L_FOOT = 14201,
        BONETAG_L_TOE = 2108,
        BONETAG_L_TOE1 = 7531,
        BONETAG_R_THIGH = 51826,
        BONETAG_R_CALF = 36864,
        BONETAG_R_FOOT = 52301,
        BONETAG_R_TOE = 20781,
        BONETAG_R_TOE1 = 45631,
        BONETAG_NECKROLL = 35731,
        BONETAG_L_ARMROLL = 5232,
        BONETAG_R_ARMROLL = 37119,
        BONETAG_L_FOREARMROLL = 61007,
        BONETAG_R_FOREARMROLL = 43810,
        BONETAG_L_THIGHROLL = 23639,
        BONETAG_R_THIGHROLL = 6442,
        BONETAG_L_PH_HAND = 60309,
        BONETAG_R_PH_HAND = 28422,
        BONETAG_WEAPON_GRIP = 41922,
        BONETAG_WEAPON_GRIP2 = 18212,
        BONETAG_CAMERA = 33399,
        _0xFFAEFCDF = 38180,
        BONETAG_L_STIRRUP = 39126,
        BONETAG_R_STIRRUP = 39638,
        BONETAG_L_IK_HAND = 36029,
        BONETAG_R_IK_HAND = 6286,
        BONETAG_TAIL0 = 838,
        BONETAG_TAIL1 = 839,
        BONETAG_TAIL2 = 840,
        BONETAG_TAIL3 = 841,
        BONETAG_TAIL4 = 842,
        BONETAG_TAIL5 = 843,
        _0x421C25DF = 30992,
        _0x2FE58172 = 30993,
        _0x25A66CF4 = 30994,
        _0x1338C819 = 30995,
        _0x005A225C = 30996,
        _0xF68C0EC0 = 30997,
        BONETAG_TAILM1 = 6986,
        BONETAG_TAILM2 = 6987,
        BONETAG_TAILM3 = 6988,
        BONETAG_JAW = 16351,
        BONETAG_L_CLAW = 1805,
        BONETAG_R_CLAW = 39905,
        BONETAG_L_EYE = 5956,
        BONETAG_R_EYE = 6468,
        BONETAG_L_EYE2 = 25260,
        BONETAG_R_EYE2 = 27474,
        BONETAG_FACING_DIR = 56604,
        BONETAG_LOOK_DIR = 12844,
        BONETAG_L_PH_FOOT = 57717,
        BONETAG_R_PH_FOOT = 24806,
        BONETAG_L_IK_FOOT = 65245,
        BONETAG_R_IK_FOOT = 35502,
        BONETAG_HIGH_HEELS = 15570,
        _0x70328671 = 28462,
        BONETAG_HAIR_SCALE = 13201,
        BONETAG_HAIR_HEIGHT = 48472,
        BONETAG_GUN_STOCK = 5930,
        BONETAG_BAGROOT = 44297,
        BONETAG_BAGPIVOTROOT = 47158,
        BONETAG_BAGPIVOT = 19729,
        BONETAG_BAGBODY = 43885,
        BONETAG_BAGBONE_R = 2359,
        BONETAG_BAGBONE_L = 2449,
        BONETAG_HEAD_X = 19336,
        BONETAG_NECK_X = 64744,
        BONETAG_NECK_Y = 64745,
        BONETAG_NECK_Z = 64746,
        _0xBAA782A6 = 56194,
        _0x488ECBC1 = 45733,
        _0xFA46AF32 = 45734,
        _0x75E3A66A = 45735,
        _0x9B0BF8B7 = 48389,
        _0x820E46BC = 48390,
        _0xBB35B90A = 48391,
        _0x1B20EC20 = 30929,
        _0xE2AE184D = 33869,
        _0x2C83817A = 4126,
    },
    CWeaponBoneId = {
        -- note that CWeaponInfo's AttachBone uses hash instead of this enum
        Gun_Feed = 36598,
        gun_drum = 29951,
        gun_cylinder = 3562,
        WAPClip = 1477,
        gun_vfx_projtrail = 41460,
        Gun_ARM = 35315,
        Gun_SuMuzzle = 19851,
        Gun_FLMuzzle = 17662,
        Torch_Bulb = 25508,
        Bulb_On = 37737,
        Bulb_Off = 54012,
        AAPSupp = 23965,
        AAPFlsh = 33620,
        AAPBarrel = 38168,
        AAPCamo = 18555,
        AAPCamo2 = 33074,
        AAPClip = 21180,
        AAPCover = 27427,
        AAPGrip = 39100,
        AAPScop = 19341
    },
    SpecialScopeType = {
        None = 0,
        NightVision = 1,
        ThermalVision = 2
    }
}

local bone_keys = {
    "GunFeedBone",
    "RotateBarrelBone",
    "RotateBarrelBone2",
    "LightBone",
    "FlashLightBone",
    "FlashLightBoneBulbOn",
    "FlashLightBoneBulbOff",
    "MuzzleBone",
    "AttachBone"
}
for _, key in pairs(bone_keys) do gta_enums[key] = gta_enums.CWeaponBoneId end

gta_ptfx={
    bullet_shotgun_tracer="core",
    bullet_tracer="core",
    bullet_tracer_ba_vehicle_remote_mg="weap_ba_vehicle_weapons",
    bullet_tracer_ch_tank_laser="weap_ch_vehicle_weapons",
    bullet_tracer_ch_tank_mg="weap_ch_vehicle_weapons",
    bullet_tracer_gr_tintable="weap_gr_weapons",
    bullet_tracer_ie_vehicle_mg="weap_ie_vehicle_mg",
    bullet_tracer_ih_patrolboat="weap_ih_patrolboat",
    bullet_tracer_jet="core",
    bullet_tracer_mg="core",
    bullet_tracer_opp_fp="weap_gr_vehicle_weapons",
    bullet_tracer_railgun="core",
    bullet_tracer_sm_vehicle_mg="veh_sm_vig",
    bullet_tracer_turret="veh_mounted_turrets_car",
    bullet_tracer_turret_gr="weap_gr_vehicle_weapons",
    bullet_tracer_turret_gr_tampa="weap_gr_vehicle_weapons",
    bullet_tracer_turret_mogul="weap_sm_mogul",
    bullet_tracer_turret_sm="weap_sm_bom",
    bullet_tracer_turret_tula="weap_sm_tula",
    bullet_tracer_valkyrie="veh_mounted_turrets_heli",
    bullet_tracer_xm_akula_mg_turret="veh_akula",
    bullet_tracer_xm_barrage_turret="veh_barrage",
    bullet_tracer_xm_khanjali_mg="veh_khanjali",
    bullet_tracer_xm_thruster_mg="veh_thruster",
    bullet_tracer_xs_sr="weap_xs_weapons",
    bullet_tracer_xs_vehicle_remote_mg_sf="weap_xs_vehicle_weapons",
    eject_auto="core",
    eject_auto_fp="core",
    eject_ba_vehicle_remote_mg="weap_ba_vehicle_weapons",
    eject_ba_vehicle_remote_minigun="weap_ba_vehicle_weapons",
    eject_clown="scr_rcbarry2",
    eject_dbshotgun="weap_dbshotgun",
    eject_dbshotgun_fp="weap_dbshotgun",
    eject_heli_gun="core",
    eject_heli_gun_ann="weap_ih_vehicle_ann2",
    eject_ih_gpistol="weap_ih_gpistol",
    eject_ih_gpistol_fp="weap_ih_gpistol",
    eject_ih_turret_patrolboat="weap_ih_patrolboat",
    eject_ih_turret_patrolboat_twinmg="weap_ih_patrolboat",
    eject_minigun="core",
    eject_minismg="weap_minismg",
    eject_minismg_fp="weap_minismg",
    eject_mounted_turret="veh_mounted_turrets_car",
    eject_mounted_turret="veh_mounted_turrets_heli",
    eject_mounted_turret_dune_mg="weap_gr_vehicle_weapons",
    eject_mounted_turret_dune_minigun="weap_gr_vehicle_weapons",
    eject_mounted_turret_insurgent3_minigun="weap_gr_vehicle_weapons",
    eject_mounted_turret_limo="veh_mounted_turret_limo",
    eject_mounted_turret_quadmg="weap_gr_vehicle_weapons",
    eject_mounted_turret_tampa_minigun="weap_gr_vehicle_weapons",
    eject_mounted_turret_technical="veh_mounted_turrets_car",
    eject_mounted_turret_twinmg="weap_gr_vehicle_weapons",
    eject_pistol="core",
    eject_pistol_fp="core",
    eject_revolver="weap_revolver",
    eject_shotgun="core",
    eject_shotgun_ap="weap_xm_shotgun_rounds",
    eject_shotgun_ap_fp="weap_xm_shotgun_rounds",
    eject_shotgun_exp="weap_xm_shotgun_rounds",
    eject_shotgun_exp_fp="weap_xm_shotgun_rounds",
    eject_shotgun_fp="core",
    eject_shotgun_hp="weap_xm_shotgun_rounds",
    eject_shotgun_hp_fp="weap_xm_shotgun_rounds",
    eject_shotgun_inc="weap_xm_shotgun_rounds",
    eject_shotgun_inc_fp="weap_xm_shotgun_rounds",
    eject_sm_bom_twinmg="weap_sm_bom",
    eject_sm_tula_turret_mg="weap_sm_tula",
    eject_sm_tula_turret_minigun="weap_sm_tula",
    eject_smg_fp="core",
    eject_sniper="core",
    eject_sniper_amrifle="core",
    eject_sniper_heavy="core",
    eject_stungun="core",
    eject_valkyrie="veh_mounted_turrets_heli",
    eject_xm_akula_mg_turret="veh_akula",
    eject_xm_barrage_mg_turret="veh_barrage",
    eject_xm_barrage_mg_turret_rear="veh_barrage",
    eject_xm_barrage_minigun_turret="veh_barrage",
    eject_xm_khanjali_mg="veh_khanjali",
    eject_xm_revolver="weap_xm_revolver",
    muz_alternate_star="core",
    muz_alternate_star_fp="core",
    muz_assault_rifle="core",
    muz_assault_rifle_fp="core",
    muz_ba_vehicle_front_mg="weap_ba_vehicle_weapons",
    muz_ba_vehicle_remote_mg="weap_ba_vehicle_weapons",
    muz_ba_vehicle_remote_minigun="weap_ba_vehicle_weapons",
    muz_ba_vehicle_remote_missile="weap_ba_vehicle_weapons",
    muz_buzzard="core",
    muz_ch_tank_flamethrower="weap_ch_vehicle_weapons",
    muz_ch_tank_laser="weap_ch_vehicle_weapons",
    muz_ch_tank_mg="weap_ch_vehicle_weapons",
    muz_ch_tank_rocket="weap_ch_vehicle_weapons",
    muz_clown="scr_rcbarry2",
    muz_gr_vehicle_mg="weap_gr_vehicle_weapons",
    muz_gr_vehicle_opp="weap_gr_vehicle_weapons",
    muz_hunter="core",
    muz_ie_vehicle_mg="weap_ie_vehicle_mg",
    muz_ih_gpistol="weap_ih_gpistol",
    muz_ih_turret_patrolboat="weap_ih_patrolboat",
    muz_indep_firework="wpn_indep_firework",
    muz_laser="core",
    muz_minigun="core",
    muz_minigun_alt="core",
    muz_mounted_turret="veh_mounted_turrets_car",
    muz_mounted_turret_apc="weap_gr_vehicle_weapons",
    muz_mounted_turret_apc_mg="weap_gr_vehicle_weapons",
    muz_mounted_turret_apc_missile="weap_gr_vehicle_weapons",
    muz_mounted_turret_dune_mg="weap_gr_vehicle_weapons",
    muz_mounted_turret_dune_minigun="weap_gr_vehicle_weapons",
    muz_mounted_turret_dune_minigun_fp="weap_gr_vehicle_weapons",
    muz_mounted_turret_tampa_minigun="weap_gr_vehicle_weapons",
    muz_mounted_turret_twinmg="weap_gr_vehicle_weapons",
    muz_mounted_turret_twinmg_trailer="weap_gr_vehicle_weapons",
    muz_musket_ng="wpn_musket",
    muz_pistol="core",
    muz_pistol_fp="core",
    muz_pistol_silencer="core",
    muz_railgun="core",
    muz_rpg="core",
    muz_shotgun="core",
    muz_sm_bom_cannon="weap_sm_bom",
    muz_sm_bom_twinmg="weap_sm_bom",
    muz_sm_mogul_turret_mg="weap_sm_mogul",
    muz_sm_tula_mg="weap_sm_tula",
    muz_sm_tula_turret_mg="weap_sm_tula",
    muz_sm_vehicle_mg="veh_sm_vig",
    muz_smg="core",
    muz_smg_fp="core",
    muz_smoking_barrel="core",
    muz_smoking_barrel_fp="core",
    muz_smoking_barrel_minigun="core",
    muz_smoking_barrel_rocket="core",
    muz_smoking_barrel_shotgun="core",
    muz_stungun="core",
    muz_tank="core",
    muz_torpedo="veh_stromberg",
    muz_valkyrie="veh_mounted_turrets_heli",
    muz_valkyrie_turret="veh_mounted_turrets_heli",
    muz_xm_akula_mg_turret="veh_akula",
    muz_xm_barrage_mg_turret="veh_barrage",
    muz_xm_barrage_minigun_turret="veh_barrage",
    muz_xm_cherno="veh_chernobog",
    muz_xm_khanjali_mg="veh_khanjali",
    muz_xm_khanjali_railgun="veh_khanjali",
    muz_xm_khanjali_railgun_charge="veh_khanjali",
    muz_xm_revolver="weap_xm_revolver",
    muz_xm_strom_mg="veh_stromberg",
    muz_xm_thruster_mg="veh_thruster",
    muz_xm_thruster_rpg="veh_thruster",
    muz_xm_volatol_twinmg="veh_volatol",
    muz_xs_sr_carbine="weap_xs_weapons",
    muz_xs_sr_minigun="weap_xs_weapons",
    muz_xs_sr_raygun="weap_xs_weapons",
    muz_xs_turret_flamethrower_looping="weap_xs_vehicle_weapons",
    muz_xs_turret_flamethrower_looping_sf="weap_xs_vehicle_weapons",
    muz_xs_vehicle_remote_mg_sf="weap_xs_vehicle_weapons",
    muz_yacht_defence="scr_apartment_mp",
    proj_ba_remote_gl_trail="weap_ba_vehicle_weapons",
    proj_disturb_dust="core",
    proj_flare_fuse="core",
    proj_flare_fuse_fp="core",
    proj_flare_trail="core",
    proj_gr_moc_cannon_trail="weap_gr_vehicle_weapons",
    proj_grenade_smoke="core",
    proj_grenade_trail="core",
    proj_heist_flare_trail="wpn_flare",
    proj_indep_flare_trail="proj_indep_firework",
    proj_laser_enemy="core",
    proj_laser_player="core",
    proj_missile_trail="core",
    proj_missile_underwater="core",
    proj_molotov_flame="core",
    proj_molotov_flame_fp="core",
    proj_molotov_trail="core",
    proj_mounted_turret_mortar="weap_gr_vehicle_weapons",
    proj_pipebomb_smoke="weap_pipebomb",
    proj_rpg_barrage_trail="weap_sm_barrage",
    proj_rpg_trail="core",
    proj_snowball_fuse="proj_xmas_snowball",
    proj_snowball_trail="proj_xmas_snowball",
    proj_tank_trail="core",
    proj_torpedo_trail="veh_stromberg",
    proj_xm_khanjali_grenade_trail="veh_khanjali",
    proj_xm_khanjali_railgun_trail="veh_khanjali",
    proj_xm_thruster_rpg_trail="veh_thruster",
    proj_xs_sr_raygun_trail="weap_xs_weapons",
    proj_yacht_defence_trail="scr_apartment_mp",
    scr_agency3b_proj_rpg_trail="scr_agencyheistb",
    scr_bigscore_rpg_trail="scr_bigscore",
    scr_ex2_rpg_trail="scr_exile2",
    scr_ie_vv_muzzle_flash="scr_ie_vv",
    scr_impexp_tw_rpg_trail="scr_ie_tw",
    scr_sum_gy_exp_water_bomb="scr_sum_gy",
    scr_sum_gy_water_bomb_trail="scr_sum_gy",
    scr_xs_guided_missile_trail="scr_xs_props",
    tracer_xm_shotgun_inc="weap_xm_shotgun_rounds",
    veh_nitrous="veh_xs_vehicle_mods",
    veh_rocket_boost="veh_impexp_rocket",
    weap_ch_hazcan="weap_ch_weapons",
    weap_ch_hazcan_splash_sp="weap_ch_weapons",
    weap_extinguisher="core",
    weap_heist_flare_trail="core",
    weap_hvy_turbulance_default="core",
    weap_hvy_turbulance_dirt="core",
    weap_hvy_turbulance_foliage="core",
    weap_hvy_turbulance_sand="core",
    weap_hvy_turbulance_water="core",
    weap_petrol_can="core",
    weap_smoke_grenade="core",
    weap_veh_turbulance_default="core",
    weap_veh_turbulance_dirt="core",
    weap_veh_turbulance_foliage="core",
    weap_veh_turbulance_sand="core",
    weap_veh_turbulance_water="core"
}

gta_sfx={
    -- this is way too much effort.. just swap weapons.
    audio_item_vehicle_weapon_minitank_mg="DLC_HEIST3/MINITANK",
    audio_item_vehicle_weapon_minitank_rocket="DLC_HEIST3/MINITANK",
    audio_item_vehicle_weapon_mini_flamethrower="DLC_HEIST3/MINITANK",
    audio_item_pistol_xm3="DLC_CM2022/WEAPON_9MM_PISTOL",
    audio_item_gadget_pistol="DLC_HEI4/WEAPON_GADGET_PISTOL",
    audio_item_tec_pistol="DLC_MP2023_1/WEAPON_TEC_PISTOL",
    audio_item_db_shotgun="DLC_LOW2/DB_SHOTGUN",
    audio_item_autoshotgun="DLC_BIKER/AUTO_SHOTGUN",
    audio_item_compactlauncher="DLC_BIKER/SPL_LAUNCHER",
    audio_item_doubleaction_revolver="DLC_CHRISTMAS2017/PTL_DOUBLEACTION_REVOLVER",
    audio_item_revolver="DLC_APARTMENT/PTL_REVOLVER",
    audio_item_navy_revolver="DLC_HEIST3/PTL_NAVY_REVOLVER",
    audio_item_combat_shotgun="DLC_HEI4/COMBAT_SHOTGUN",
    audio_item_service_carbine="DLC_MPSUM2/WEAPON_SERVICE_CARBINE",
    audio_item_precision_rifle="DLC_MPSUM2/WEAPON_PRECISION_RIFLE",
    audio_item_heavy_rifle="DLC_SECURITY/WEAPON_HEAVY_RIFLE",
    audio_item_emp_launcher="DLC_SECURITY/WEAPON_EMP_LAUNCHER",
    audio_item_bullpup="DLC_HEI4/WEAPON_BULLPUP",
    -- DLC_HEI4/DLC_HEI4_FH_MG
    -- DLC_HEI4/DLC_HEI4_V_MG
    audio_item_pistol="WEAPONS_PLAYER/PTL_PISTOL",
    audio_item_combatpistol="WEAPONS_PLAYER/PTL_COMBAT",
    audio_item_appistol="WEAPONS_PLAYER/PTL_PX4",--?
    audio_item_pistol50="WEAPONS_PLAYER/PTL_50CAL",
    -- WEAPONS_PLAYER/PTL_RUBBER
    audio_item_microsmg="WEAPONS_PLAYER/SMG_Micro",
    audio_item_smg="WEAPONS_PLAYER/SMG_SMG",
    -- WEAPONS_PLAYER/MGN_SML_AM83_verB
    -- WEAPONS_PLAYER/MGN_SML_AM83_verA
    -- WEAPONS_PLAYER/MGN_SML_Sc__L
    audio_item_mg="WEAPONS_PLAYER/LMG_MG_PLAYER",
    audio_item_combatmg="WEAPONS_PLAYER/LMG_COMBAT",
    audio_item_pumpshotgun="WEAPONS_PLAYER/SHT_PUMP",
    audio_item_bullpupshotgun="WEAPONS_PLAYER/SHT_BULLPUP",
    audio_item_sniperrifle="WEAPONS_PLAYER/SNP_RIFLE",
    audio_item_heavysniper="WEAPONS_PLAYER/SNP_HEAVY",
    audio_item_rpg="WEAPONS_PLAYER/SPL_RPG_PLAYER",
    audio_item_vehicle_tank="WEAPONS_PLAYER/SPL_TANK_PLAYER",
    audio_item_grenadelauncher="WEAPONS_PLAYER/SPL_GRENADE_PLAYER",
    audio_item_railgun="WEAPONS_PLAYER/SPL_RAILGUN",
    audio_item_mp_railgun="WEAPONS_PLAYER/SPL_RAILGUN",
    audio_item_minigun="WEAPONS_PLAYER/SPL_MINIGUN_PLAYER"
    -- WEAPONS_PLAYER/SPL_PROG_AR_PLAYER
    -- WEAPONS_PLAYER/VEH_VALKYRIE_PLAYER
}

gta_anim_set_keys = {
    "Trevor",
    'FirstPersonScope',
    'FirstPersonTrevorScope',
    'FirstPersonFranklinAiming',
    'FirstPersonMichaelAiming',
    "Franklin",
    'SuperFat',
    'Ballistic',
    "Michael",
    'GangFemale',
    'Female',
    'Gang1H',
    'FirstPersonMPFemale',
    'Hillbilly',
    'FirstPersonRNG',
    'FirstPersonTrevor',
    'MP_F_Freemode',
    'FirstPersonFranklinScope',
    'FirstPersonMichaelRNG',
    'Gang',
    'FirstPersonFranklinRNG',
    'FirstPersonFranklin',
    'Fat',
    'FirstPersonMichaelScope',
    'FirstPersonAiming',
    'FirstPersonTrevorRNG',
    'Default', -- 26
    'FirstPersonMichael',
    'FirstPerson',
    'FirstPersonTrevorAiming'
}
