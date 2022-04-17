import std/options

type
  SummonerId* = int64

type 
  Queue* {.pure.} = enum
    Draft
    Blind
    RankedSolo5x5
    RankedFlexSr
    Clash
    BotsInto
    BotsBeginner
    BotsIntermediate
    Aram
    RankedTFT
    RankedTFTTurbo
    TutorialTFT
    NexusBlitz
    PracticeTool

  GameType* {.pure.} = enum
    CustomGame
    MatchedGame
    TutorialGame

  GameMode* {.pure.} = enum
    Aram
    ARSR
    Ascension
    Assassinate
    Classic
    DarkStar
    DoomBotsTeemo
    FirstBlood
    GameModeX

  Division* {.pure.} = enum
    NA  = 0
    IV  = 1
    III = 2
    II  = 3
    I   = 4

  Tier* {.pure.} = enum
    Unranked    = 0
    Iron        = 1
    Bronze      = 2
    Silver      = 3
    Gold        = 4
    Platinum    = 5
    Diamond     = 6
    Master      = 7
    Grandmaster = 8
    Challenger  = 9

  Region* {.pure.} = enum
    BR
    EUNE
    EUW
    NA
    KR
    LAN
    LAS
    OCE
    RU
    TR
    JP
    PBE
    AMERICAS
    EUROPE
    ASIA
    SEA
    NONE

  Position* {.pure.} = enum
    Top
    Jungle
    Middle
    Bottom
    Utility
    Fill
    Unselected

  SummonerSpell* {.pure.} = enum
    Invalid
    None
    Cleanse
    Exhaust
    Flash
    Ghost
    Heal
    Smite
    Teleport 
    Clarity
    Ignite
    Barrier
    ToTheKing
    PoroToss
    Snowball
    PlaceHolder
    PlaceHolderAttackSmite

  PerkCategory* {.pure.} = enum
    Precision
    Domination
    Sorcery
    Resolve
    Inspiration

  Perk* {.pure.} = enum
    Invalid
    # Util
    HealthScaling
    Armor
    MagicRes
    AttackSpeed
    CDRScaling
    Adaptive

    # Precision
    PressTheAttack
    LethalTempo
    Conqueror
    FleetFootwork
  
    Overheal
    Triumph
    PresenceOfMind

    LegendAlacrity
    LegendTenacity
    LegendBloodline

    CoupDeGras
    CutDown
    LastStand

    # Domination
    Electrocute
    Predator
    DarkHarvest
    HailOfBlades

    CheapShot
    TasteOfBlood
    SuddenImpact

    ZombieWard
    GhostPoro
    EyeBallCollection

    TreasureHunter
    IngeniousHunter
    RelentlessHunter
    UltimateHunter

    # Sorcery
    SummonAery
    ArcaneComet
    PhaseRush

    NullifyingOrb
    ManaflowBand
    NimbusCloak

    Trancendence
    Celerity
    AbsoluteFocus

    Scorch
    WaterWalking
    GatheringStorm

    # Resolve
    GraspOfTheUndying
    Aftershock
    Guardian

    Demolish
    FontOfLife
    ShieldBash

    Conditioning
    SecondWind
    BonePlating

    Overgrowth
    Revitalize
    Unflinching

    # Inspiration
    GlacialAugment
    UnsealedSpellBook
    FirstStrike

    HextechFlashtraption
    MagicalFootwear
    PerfectTiming

    FuturesMarket
    MinionDematerializer
    BiscuitDelivery

    CosmicInsight
    ApproachVelocity
    TimeWarpTonic

type
  GameFlowPhase* {.pure.} = enum
    None
    Lobby
    Matchmaking
    ReadyCheck
    ChampSelect
    GameStart
    InProgress
    PreEndOfGame
    EndOfGame
    WaitingForStats
    TerminatedInError

const positionsAll* = [Position.Top, Position.Jungle, Position.Middle, Position.Bottom, Position.Utility]

const positionToString* = [
  Position.Top: "Top",
  Position.Jungle: "Jungle",
  Position.Middle: "Middle",
  Position.Bottom: "Bottom",
  Position.Utility: "Support",
]

const summonersNormalList* = [
  SummonerSpell.Cleanse,
  SummonerSpell.Exhaust,
  SummonerSpell.Flash,
  SummonerSpell.Ghost,
  SummonerSpell.Heal,
  SummonerSpell.Smite,
  SummonerSpell.Teleport,
  SummonerSpell.Clarity,
  SummonerSpell.Ignite,
  SummonerSpell.Barrier,
]

const summonerToString* = [
  SummonerSpell.Invalid: "Invalid",
  SummonerSpell.None: "None",
  SummonerSpell.Cleanse: "Cleanse",
  SummonerSpell.Exhaust: "Exhaust",
  SummonerSpell.Flash: "Flash",
  SummonerSpell.Ghost: "Ghost",
  SummonerSpell.Heal: "Heal",
  SummonerSpell.Smite: "Smite",
  SummonerSpell.Teleport: "Teleport",
  SummonerSpell.Clarity: "Clarity",
  SummonerSpell.Ignite: "Ignite",
  SummonerSpell.Barrier: "Barrier",
  SummonerSpell.ToTheKing: "To Poro King",
  SummonerSpell.PoroToss: "Poro King",
  SummonerSpell.Snowball: "Snowball",
]



const summonerSpellId* = [
  SummonerSpell.Invalid: -1,
  SummonerSpell.None: 0,
  SummonerSpell.Cleanse: 1,
  SummonerSpell.Exhaust: 3,
  SummonerSpell.Flash: 4,
  SummonerSpell.Ghost: 6,
  SummonerSpell.Heal: 7,
  SummonerSpell.Smite: 11,
  SummonerSpell.Teleport: 12,
  SummonerSpell.Clarity: 13,
  SummonerSpell.Ignite: 14,
  SummonerSpell.Barrier: 21,
  SummonerSpell.ToTheKing: 30,
  SummonerSpell.PoroToss: 31,
  SummonerSpell.Snowball: 32,
  SummonerSpell.PlaceHolder: 54,
  SummonerSpell.PlaceHolderAttackSmite: 66
]

const runeId* = [
  Perk.Invalid: 0,
  Perk.HealthScaling: 5001,
  Perk.Armor: 5002,
  Perk.MagicRes: 5003,
  Perk.AttackSpeed: 5005,
  Perk.CDRScaling: 5007,
  Perk.Adaptive: 5008,

  # Precision
  Perk.PressTheAttack: 8005,
  Perk.LethalTempo: 8008,
  Perk.Conqueror: 8010,
  Perk.FleetFootwork: 8021,

  Perk.Overheal: 9101,
  Perk.Triumph: 9111,
  Perk.PresenceOfMind: 8009,

  Perk.LegendAlacrity: 9104,
  Perk.LegendTenacity: 9105,
  Perk.LegendBloodline: 9103,

  Perk.CoupDeGras: 8014,
  Perk.CutDown: 8017,
  Perk.LastStand: 8299,

  # Domination
  Perk.Electrocute: 8112,
  Perk.Predator: 8124,
  Perk.DarkHarvest: 8128,
  Perk.HailOfBlades: 9923,

  Perk.CheapShot: 8126,
  Perk.TasteOfBlood: 8139,
  Perk.SuddenImpact: 8143,

  Perk.ZombieWard: 8136,
  Perk.GhostPoro: 8120,
  Perk.EyeBallCollection: 8138,

  Perk.TreasureHunter: 8135,
  Perk.IngeniousHunter: 8134,
  Perk.RelentlessHunter: 8105,
  Perk.UltimateHunter: 8106,

  # Sorcery
  Perk.SummonAery: 8214,
  Perk.ArcaneComet: 8229,
  Perk.PhaseRush: 8230,

  Perk.NullifyingOrb: 8224,
  Perk.ManaflowBand: 8226,
  Perk.NimbusCloak: 8275,

  Perk.Trancendence: 8210,
  Perk.Celerity: 8234,
  Perk.AbsoluteFocus: 8233,

  Perk.Scorch: 8237,
  Perk.WaterWalking: 8232,
  Perk.GatheringStorm: 8236,

  # Resolve
  Perk.GraspOfTheUndying: 8437,
  Perk.Aftershock: 8439,
  Perk.Guardian: 8465,

  Perk.Demolish: 8446,
  Perk.FontOfLife: 8463,
  Perk.ShieldBash: 8401,

  Perk.Conditioning: 8429,
  Perk.SecondWind: 8444,
  Perk.BonePlating: 8473,

  Perk.Overgrowth: 8451,
  Perk.Revitalize: 8453,
  Perk.Unflinching: 8242,

  # Inspiration
  Perk.GlacialAugment: 8351,
  Perk.UnsealedSpellBook: 8360,
  Perk.FirstStrike: 8369,

  Perk.HextechFlashtraption: 8306,
  Perk.MagicalFootwear: 8304,
  Perk.PerfectTiming: 8313,

  Perk.FuturesMarket: 8321,
  Perk.MinionDematerializer: 8316,
  Perk.BiscuitDelivery: 8345,

  Perk.CosmicInsight: 8347,
  Perk.ApproachVelocity: 8410,
  Perk.TimeWarpTonic: 8352,
]

const perkToString* = [
  Perk.Invalid: "Invalid",
  
  Perk.HealthScaling: "HP",
  Perk.Armor: "Armor",
  Perk.MagicRes: "MR",
  Perk.AttackSpeed: "ATS",
  Perk.CDRScaling: "CDR",
  Perk.Adaptive: "Force",

  # Precision
  Perk.PressTheAttack: "Press The Attack",
  Perk.LethalTempo: "Lethal Tempo",
  Perk.Conqueror: "Conquorer",
  Perk.FleetFootwork: "Fleet Footwork",

  Perk.Overheal: "Overheal",
  Perk.Triumph: "Triumph",
  Perk.PresenceOfMind: "Presence of Mind",

  Perk.LegendAlacrity: "Alacrity",
  Perk.LegendTenacity: "Tenacity",
  Perk.LegendBloodline: "Bloodline",

  Perk.CoupDeGras: "Coup de Gras",
  Perk.CutDown: "Cut Down",
  Perk.LastStand: "Last Stand",

  # Domination
  Perk.Electrocute: "Electrocute",
  Perk.Predator: "Predator",
  Perk.DarkHarvest: "Dark Harvest",
  Perk.HailOfBlades: "Hail of Blades",

  Perk.CheapShot: "Cheap Shot",
  Perk.TasteOfBlood: "Taste of Blood",
  Perk.SuddenImpact: "Sudden Impact",

  Perk.ZombieWard: "Zombie Ward",
  Perk.GhostPoro: "Ghost Poro",
  Perk.EyeBallCollection: "EyeBall Collection",

  Perk.TreasureHunter: "Treasure Hunter",
  Perk.IngeniousHunter: "Ingenious Hunter",
  Perk.RelentlessHunter: "Relentless Hunter",
  Perk.UltimateHunter: "Ultimate Hunter",

  # Sorcery
  Perk.SummonAery: "Summon Aery",
  Perk.ArcaneComet: "Arcane Comet",
  Perk.PhaseRush: "Phase Rush",

  Perk.NullifyingOrb: "Nullifying Orb",
  Perk.ManaflowBand: "Manaflow Band",
  Perk.NimbusCloak: "Nimbus Cloak",

  Perk.Trancendence: "Trancendence",
  Perk.Celerity: "Celerity",
  Perk.AbsoluteFocus: "Absolute Focus",

  Perk.Scorch: "Scorch",
  Perk.WaterWalking: "Water Walking",
  Perk.GatheringStorm: "Gathering Storm",

  # Resolve
  Perk.GraspOfTheUndying: "Grasp of The Undying",
  Perk.Aftershock: "Aftershock",
  Perk.Guardian: "Guarding",

  Perk.Demolish: "Demolish",
  Perk.FontOfLife: "Font of Life",
  Perk.ShieldBash: "Shield Bash",

  Perk.Conditioning: "Conditioning",
  Perk.SecondWind: "Second Wind",
  Perk.BonePlating: "Bone Plating",

  Perk.Overgrowth: "Overgrowth",
  Perk.Revitalize: "Revitalzie",
  Perk.Unflinching: "Unflinching",

  # Inspiration
  Perk.GlacialAugment: "Glacial Augment",
  Perk.UnsealedSpellBook: "Unsealed Spellbook",
  Perk.FirstStrike: "First Strike",

  Perk.HextechFlashtraption: "Hextech Flash",
  Perk.MagicalFootwear: "Magical Footwear",
  Perk.PerfectTiming: "Perfect Timing",

  Perk.FuturesMarket: "Futures Market",
  Perk.MinionDematerializer: "Minion Dematerializer",
  Perk.BiscuitDelivery: "Biscuit Delivery",

  Perk.CosmicInsight: "Cosmic Insight",
  Perk.ApproachVelocity: "Approach Velocity",
  Perk.TimeWarpTonic: "Time Warp Tonic",
]

const perkCategoriesAll* = [    
  PerkCategory.Precision,
  PerkCategory.Domination,
  PerkCategory.Sorcery,
  PerkCategory.Resolve,
  PerkCategory.Inspiration,
]
const perkCategoryToString* = [
  PerkCategory.Precision: "Precision",
  PerkCategory.Domination: "Domination",
  PerkCategory.Sorcery: "Sorcery",
  PerkCategory.Resolve: "Resolve",
  PerkCategory.Inspiration:"Inspiration"
]

proc queueFrom*(id: uint32): Option[Queue] =
  case id:
    of 400  : result = some Queue.Draft
    of 430  : result = some Queue.Blind
    of 420  : result = some Queue.RankedSolo5x5
    of 440  : result = some Queue.RankedFlexSr
    of 700  : result = some Queue.Clash
    of 830  : result = some Queue.BotsInto
    of 840  : result = some Queue.BotsBeginner
    of 850  : result = some Queue.BotsIntermediate
    of 1090 : result = some Queue.RankedTFT
    of 1110 : result = some Queue.TutorialTFT
    of 1130 : result = some Queue.RankedTFTTurbo
    of 1300 : result = some Queue.NexusBlitz
    else    : result = none Queue

proc queueToId*(queue: Queue): uint32 =
  case queue:  
    of Queue.Draft            : result = 400
    of Queue.Blind            : result = 430
    of Queue.RankedSolo5x5    : result = 420
    of Queue.RankedFlexSr     : result = 440
    of Queue.Clash            : result = 700
    of Queue.BotsInto         : result = 830
    of Queue.BotsBeginner     : result = 840
    of Queue.BotsIntermediate : result = 850
    of Queue.Aram             : result = 931
    of Queue.RankedTFT        : result = 1090
    of Queue.RankedTFTTurbo   : result = 1110
    of Queue.TutorialTFT      : result = 1130
    of Queue.NexusBlitz       : result = 1300
    of Queue.PracticeTool     : result = 99999 # TODO: fix this

proc regionLCUFrom*(region: string): Region =
  case region
    of "EUW": result = Region.EUW
    else: discard