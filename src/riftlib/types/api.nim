import std/options

type 
  Account* = object
    puuid*: string
    gameName*: string
    tagLine*: string
    

  ActiveShard* = object
    puuid*: string
    game*: string
    activeShard*: string

  ChampionMastery* = object
    champion*: int64
    chestGranted*: bool
    championId*: int64
    lastPlayTime*: int64
    championLevel*: int32
    summonerId*: string
    championPoints*: int32
    championPointsSinceLastLevel*: int64
    tokensEarned*: int32

  ChampionInfo* = object
    maxNewPlayerLevel*: int32
    freeChampionIdsForNewPlayers*: seq[int32]
    freeChampionIds*: seq[int32]


  Player* = object
    summonerId*: string
    teamId*: string
    position*: string
    role*: string
    

  Team* = object
    id*: string
    tournamentId*: int32
    name*: string
    iconId*: int32
    tier*: int32
    captain*: string # summonerId
    abbreviation*: string
    players*: seq[Player]
    

  Tournament* = object
    id*: int32
    themeId*: int32
    nameKey*: string
    nameKeySecondary*: string
    schedule*: seq[TournamentPhase]
    

  TournamentPhase* = object
    id*: int32
    registrationTime*: int64
    startTime*: int64
    cancelled*: bool

  LeagueEntry* = object
    leagueId*: string
    summonerId*: string
    summonerName*: string
    queueType*: string
    tier*: string
    rank*: string
    leaguePoints*: int32
    wins*: int32
    losses*: int32
    hotStreak*: bool
    veteran*: bool
    freshBlood*: bool
    inactive*: bool
    miniSeries*: Option[MiniSeries]


  LeagueList* = object
    leagueId*: string
    entries*: seq[LeagueItem]
    tier*: string
    name*: string
    queue*: string
    

  LeagueItem* = object
    summonerId*: string
    summonerName*: string
    leaguePoints*: int32
    rank*: string
    freshBlood*: bool
    wins*: int32
    miniSeries*: Option[MiniSeries]
    inactive*: bool
    veteran*: bool
    hotStreak*: bool
    losses*: int32
    
  MiniSeries* = object
    losses*: int32
    progress*: string
    target*: int32
    wins*: int32


  PlatformData* = object
    id*: string
    name*: string
    locales*: seq[string]
    maintenance*: seq[Status]
    incidents*: seq[Status]
    

  Status* = object
    id*: int32
    maintenanceStatus*: string
    incidentSeverity*: string
    titles*: seq[Content]
    updates*: seq[Update]
    createdAt*: string
    archivedAt*: string
    updatedAt*: string
    platforms*: seq[string]
    

  Content* = object
    locale*: string
    content*: string
    

  Update* = object
    id*: int32
    author*: string
    publish*: bool
    publishLocations*: seq[string]
    translations*: seq[Content]
    createdAt*: string
    updatedAt*: string

  Summoner* = object
    accountId*: string
    profileIconId*: int32
    revisionDate*: int64
    name*: string
    id*: string
    puuid*: string
    summonerLevel*: int64
