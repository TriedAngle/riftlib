import std/options
import ./lcu
import ./champions
import ./consts

type
  SearchState* {.pure.} = enum
    Searching
    Canceled
    Found
    Other # TODO: match other
  
  GameFlowPhase* {.pure.} = enum
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
    None

  Availability* {.pure.} = enum 
    Chat
    Away
    Dnd
    Offline

type
  DodgeData* = object
    dodgerId*: Option[SummonerId]
    phase*: Option[string]
    state*: Option[string]

  LowPriorityData* = object
    bustedLeaverAccessToken*: Option[string]
    penalizedSummonerIds*: Option[seq[SummonerId]]
    penaltyTime*: Option[float64]
    reason*: Option[string]

  ReadyCheck* = object
    declinerIds*: Option[seq[SummonerId]]
    dodgeWarning*: Option[string]
    playerResponse*: Option[string]
    state*: Option[string]
    supressUx*: Option[bool]
    timer*: Option[float64]

type
  GameFlowMapData* = object
    # categorizedContentBundles*: Option[ContentBundles]
    description*: Option[string]
    gameMode*: Option[string]
    gameModeName*: Option[string]
    gameModeShortName*: Option[string]
    gameMutator*: Option[string]
    id*: Option[int32]
    isRGM*: Option[bool]
    mapstringId*: Option[string]
    platformId*: Option[string]
    platformName*: Option[string]
    # properties*: Option[GameFlowProperties]
    suppressRunesMasteriesPerks*: Option[bool]

  GameData* = object
    gameId*: Option[int64]
    gameName*: Option[string]
    isCustomGame*: Option[bool]
    password*: Option[string]
    playerChampionSelections*: seq[PlayerChampionSelection]
    queue*: Option[QueueData]
    spectatorsAllowed*: Option[bool]
    teamOne*: seq[GameDataTeamMember]
    teamTwo*: seq[GameDataTeamMember]

  GameClientData* = object
    observerServerIp*: string
    observerServerPort*: uint32
    running*: bool
    serverIp*: string
    serverPort*: uint32
    visible*: bool

  GameDataTeamMember* = object
    accountId*: int64
    summonerInternalName*: string
    summonerName*: string
  
  QueueData* = object
    allowablePremadeSizes*: Option[seq[int32]]
    areFreeChampionsAllowed*: Option[bool]
    assetMutator*: Option[string]
    category*: Option[string]
    championsRequiredToPlay*: Option[int32]
    description*: Option[string]
    gameMode*: Option[string]
    # gameTypeConfig*: Option[GameTypeConfig]
    id*: Option[int64]
    isRanked*: Option[bool]
    isTeamBuilderManaged*: Option[bool]
    isTeamOnly*: Option[bool]
    lastToggledOffTime*: Option[int64]
    lastToggledOnTime*: Option[int64]
    mapId*: Option[int64]
    maxLevel*: Option[int64]
    maxSummonerLevelForFirstWinOfTheDay*: Option[int64]
    maximumParticipantListSize*: Option[int32]
    minLevel*: Option[int64]
    minimumParticipantListSize*: Option[int32]
    name*: Option[string]
    numPlayersPerTeam*: Option[int64]
    queueAvailability*: Option[string]
    # queueRewards*: Option[QueueRewards]
    removalFromGameAllowed*: Option[bool]
    removalFromGameDelayMinutes*: Option[int64]
    shortName*: Option[string]
    showPositionSelector*: Option[bool]
    spectatorEnabled*: Option[bool]
    queueType*: Option[string] # rename to type

  PlayerChampionSelection* = object
    championId*: Champion
    selectedSkinIndex*: int32
    spell1Id*: SummonerSpell
    spell2Id*: SummonerSpell
    summonerInternalName*: string