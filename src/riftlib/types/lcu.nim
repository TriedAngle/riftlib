import std/options
import ./consts
import ./champions

type
  Lobby* = object
    canStartActivity*: Option[bool]
    chatRoomId*: Option[string]
    chatRoomKey*: Option[string]
    gameConfig*: Option[GameConfig]
    invitations*: Option[seq[Invitation]]
    localMember*: Option[Member]
    members*: Option[seq[Member]]
    partyId*: Option[string]
    partyType*: Option[string]
    restrictions*: Option[seq[Restriction]]
    warnings*: Option[seq[Warning]]
    
  GameConfig* = object
    allowablePremadeSizes*: Option[seq[int32]]
    customLobbyName*: Option[string]
    customMutatorName*: Option[string]
    customRewardsDisabledReasons*: Option[seq[string]]
    customSpectatorPolicy*: Option[string]
    customSpectators*: Option[seq[Member]]
    customTeam_100*: Option[seq[Member]]
    customTeam_200*: Option[seq[Member]]
    gameMode*: Option[string]
    isCustom*: Option[bool]
    isLobbyFull*: Option[bool]
    isTeamBuilderManaged*: Option[bool]
    mapId*: Option[int64]
    maxHumanPlayers*: Option[int64]
    maxLobbySize*: Option[int64]
    maxTeamSize*: Option[int64]
    pickType*: Option[string]
    premadeSizeAllowed*: Option[bool]
    queueId*: Option[int64]
    showPositionSelector*: Option[bool]

  Member = object
    allowedChangeActivity*: Option[bool]
    allowedInviteOthers*: Option[bool]
    allowedKickOthers*: Option[bool]
    allowedStartActivity*: Option[bool]
    allowedToggleInvite*: Option[bool]
    autoFillEligible*: Option[bool]
    autoFillProtectedPromos*: Option[bool]
    autoFillProtectedForSoloing*: Option[bool]
    autoFillProtectedForStreaking*: Option[bool]
    botChampionId*: Option[int32]
    botDifficulty*: Option[string]
    botId*: Option[string]
    firstPositionPreference*: Option[Position]
    secondPositionPreference*: Option[Position]
    isBot*: Option[bool]
    isLeader*: Option[bool]
    isSpectator*: Option[bool]
    puuid*: Option[string]
    ready*: Option[bool]
    showGhostBanner*: Option[bool]
    summonerIconId*: Option[int32]
    summonerId*: SummonerId
    summonerInternalName*: Option[string]
    summonerLevel*: Option[int64]
    summonerName*: Option[string]
    teamId*: Option[int32]

  Invitation* = object
    invitationId*: Option[string]
    invitationType*: Option[string]
    state*: Option[string]
    timestamp*: Option[string]
    toSummonerId*: Option[SummonerId]
    toSummonerName*: Option[string]

  Restriction* = object
    expiredTimestamp*: Option[float64]
    restrictionCode*: Option[string]
    summonerIds*: Option[seq[SummonerId]]
    summonerIdsstring*: Option[string]

  Warning* = object
    expiredTimestamp*: Option[float64]
    restrictionCode*: Option[string]
    summonerIds*: Option[seq[float64]]
    summonerIdsstring*: Option[string]

type
  Friend* = object
    availability*: Option[string]
    displayGroupId*: Option[int32]
    displayGroupName*: string
    gameName*: string
    gameTag*: string
    groupId*: int32
    groupName*: string
    icon*: int32
    id*: string
    isP2PConversationMuted*: Option[bool]  # "isP2PConversationMuted"
    lastSeenOnlineTimestamp*: Option[uint64]
    lol*: LoL
    name*: string
    note*: string
    patchline*: Option[string]
    pid*: Option[string]
    platformId*: Option[string]
    product*: Option[string]
    productName*: Option[string]
    puuid*: Option[string]
    statusMessage*: Option[string]
    summary*: Option[string]
    summonerId*: SummonerId
    time*: Option[float64]

  Me* = object
    availability*: Option[string]
    gameName*: Option[string]
    gameTag*: Option[string]
    icon*: Option[int32]
    id*: Option[string]
    lastSeenOnlineTimestamp*: Option[int64]
    lol*: Option[LoL]
    name*: Option[string]
    patchline*: Option[string]
    pid*: Option[string]
    platformId*: Option[string]
    product*: Option[string]
    productName*: Option[string]
    puuid*: Option[string]
    statusMessage*: Option[string]
    summary*: Option[string]
    summonerId*: Option[SummonerId]
    time*: Option[int32]

  LoL* = object
    championId*: Option[string]
    companionId*: Option[string]
    damageSkinId*: Option[string]
    gameId*: Option[string]
    gameMode*: Option[string]
    gameQueueType*: Option[string]
    gameStatus*: Option[string]
    iconOverride*: Option[string]
    initRankStat*: Option[string]
    isObservable*: Option[string]
    level*: Option[string]
    mapId*: Option[string]
    mapSkinId*: Option[string]
    masteryScore*: Option[string]
    profileIcon*: Option[string]
    pty*: Option[string]
    puuid*: Option[string]
    queueId*: Option[string]
    rankedLeagueDivision*: Option[string]
    rankedLeagueQueue*: Option[string]
    rankedLeagueTier*: Option[string]
    rankedLosses*: Option[string]
    rankedSplitRewardLevel*: Option[string]
    rankedPrevSeasonTier*: Option[string]
    rankedWins*: Option[string]
    regalia*: Option[string]
    skinVariant*: Option[string]
    skinname*: Option[string]
    timeStamp*: Option[string]
  
type
  GameClient* = object
    observerServerIp*: string
    observerServerPort*: int
    running*: bool
    serverIp*: string
    serverPort*: int
    visible*: bool
  
  GameTypeConfig* = object
    advancedLearningQuests*: bool
    allowTrades*: bool
    banMode*: string
    banTimerDuration*: int
    battleBoost*: bool
    crossTeamChampionPool*: bool
    deathMatch*: bool
    doNotRemove*: bool
    duplicatePick*: bool
    exclusivePick*: bool
    id*: int
    learningQuests*: bool
    mainPickTimerDuration*: int
    maxAllowableBans*: int
    name*: string
    onboardCoopBeginner*: bool
    pickMode*: string
    postPickTimerDuration*: int
    reroll*: bool
    teamChampionPool*: bool

  GameQueue* = object
    allowablePremadeSizes*: seq[int]
    areFreeChampionsAllowed*: bool
    assetMutator*: string
    category*: string
    championsRequiredToPlay*: int
    description*: string
    detailedDescription*: string
    gameMode*: string
    gameTypeConfig: GameTypeConfig
    id: int
    isRanked: bool
    isTeamBuilderManaged: bool
    isTeamOnly: bool
    lastToggledOffTime: int64
    lastToggledOnTime: int64
    mapId: int64
    maxLevel: int64
    maxSummonerLevelForFirstWinOfTheDay: int64
    maximumParticipantListSize: int64
    minLevel: int64
    minimumParticipantListSize: int64
    name: string
    numPlayerPerTeam: int
    queueAvailability: string
    queueRewards: GameQueueRewards
    removalFromGameAllowed: bool
    removalFromGameDelayMinutes: int64
    shortName: string
    showPositionSelector: bool
    spectatorEnabled: bool
    `type`: string

  GameQueueRewards* = object
    isChampionPointsEnabled: bool
    isIpEnabled: bool
    isXpEnabled: bool
    partySizeIpRewards: seq[int]

  GameDataTeamMember* = object
    accountId: SummonerId
    summonerInternalName: string
    summonerName: string

  GameDataPlayerChampionSelection* = object
    championId: Champion
    selectedSkinIndex: int
    spell1Id: SummonerSpell
    spell2Id: SummonerSpell
    summonerInternalName: string

  GameData* = object
    gameId: int
    gameName: string
    isCustomGame: bool
    password: string
    playerChampionSelections: seq[GameDataPlayerChampionSelection]
    queue: GameQueue
    spectatorsAllowed: bool
    teamOne: seq[GameDataTeamMember]
    teamTwo: seq[GameDataTeamMember]

  GameDodge* = object
    dodgeIds: seq[SummonerId]
    phase: string
    state: string

  # GameMapProperties* = object


  GameMap* = object
    # assets:
    # categorizedContentBundle
    description: string
    gameMode: string
    gameModeName: string
    gameModeShortName: string
    gameMutator: string
    id: int64
    isRGM: bool
    mapStringId: string
    name: string
    platformId: string
    platformName: string
    # properties: seq[GameMapProperties]

  Session* = object
    gameClient: GameClient
    gameData: GameData
    gameDodge: GameDodge
    map: GameMap
    phase: GameFlowPhase