-- Author: George Chang (George0828Zhang)
-- Credits:
-- https://github.com/Yimura/GTAV-Classes
-- https://alexguirre.github.io/rage-parser-dumps/

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
		FLAME_EXPLODE = 30,
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
		-- 76 ~ 80 does not appear as their name suggests
		MINE_CNCSPIKE = 76,
		BZGAS_MK2 = 77,
		FLASHGRENADE = 78,
		STUNGRENADE = 79,
		CNC_KINETICRAM = 80,
		SCRIPT_MISSILE_LARGE = 81,
		SUBMARINE_BIG = 82,
		EMPLAUNCHER_EMP = 83,
		RAILGUNXM3 = 84,
		BALANCED_CANNONS = 85,
	},
	FireType = {
		NONE = 0,
		MELEE = 1,
		INSTANT_HIT = 2,
		DELAYED_HIT = 3,
		PROJECTILE = 4,
		VOLUMETRIC_PARTICLE = 5 -- flamethrower
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
		_0xAF443B5F = 94,
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
		_0x68F30C0A = 167,
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
		OnlyLockOnToAquaticVehicles = 178,
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
		H_0x6EE86D27 = 15,
		ApplyDamageOnImpact = 16,
		SetOnFireOnImpact = 17,
		DontFireAnyEvents = 18,
		AlignWithTrajectory = 19,
		ExplodeAtTrailFxPos = 20,
		ProximityDetonation = 21,
		AlignWithTrajectoryYAxis = 22,
		HomingAttractor = 23,
		Cluster = 24
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
	WeaponBoneId = {
		-- not an enum!!!
		"gun_vfx_projtrail",
		"gun_vfx_eject",
		"gun_root",
		"gun_muzzle",
		"gun_magazine",
		"gun_gripr",
		"gun_gripl",
		"gun_drum",
		"gun_barrels",
		"gun_ammo",
		"WAPSupp_3",
		"WAPSupp_2",
		"WAPSupp",
		"WAPStck",
		"WAPSeWp",
		"WAPScop_3",
		"WAPScop_2",
		"WAPScop",
		"WAPLasr_2",
		"WAPLasr",
		"WAPGrip_3",
		"WAPGrip_2",
		"WAPGrip",
		"WAPFlsh_2",
		"WAPFlshLasr_3",
		"WAPFlshLasr_2",
		"WAPFlshLasr",
		"WAPFlsh",
		"WAPClip_2",
		"WAPClip",
		"WAPBarrel",
		"Torch_Bulb",
		"NM_Butt_Marker",
		"Gun_Nuzzle",
	}
}