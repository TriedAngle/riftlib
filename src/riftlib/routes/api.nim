const
  ACCOUNT_BY_PUUID* = "/riot/account/v1/accounts/by-puuid/{puuid}"
  ACCOUNT_BY_RIOT_ID* = "/riot/account/v1/accounts/by-riot-id/{gameName}/{tagLine}"
  ACCOUNT_ACTIVE_SHARDS* = "/riot/account/v1/active-shards/by-game/{game}/by-puuid/{puuid}"

  MASTERY_BY_SUMMONER* = "/lol/champion-mastery/v4/champion-masteries/by-summoner/{encryptedSummonerId}"
  MASTERY_BY_SUMMONER_BY_CHAMPION* = "/lol/champion-mastery/v4/champion-masteries/by-summoner/{encryptedSummonerId}/by-champion/{champion_id}"
  MASTERY_SCORES_BY_SUMMONER* = "/lol/champion-mastery/v4/scores/by-summoner/{encryptedSummonerId}"

  CHAMPION_ROTATIONS* = "/lol/platform/v3/champion-rotations"

  CLASH_BY_SUMMONER* = "/lol/clash/v1/players/by-summoner/{summonerId}"
  CLASH_TEAM_BY_ID* = "/lol/clash/v1/teams/{teamId}"
  CLASH_TOURNAMENTS* = "/lol/clash/v1/tournaments"
  CLASH_TOURNAMENTS_BY_TEAM* = "/lol/clash/v1/tournaments/by-team/{teamId}"
  CLASH_TOURNAMENTS_BY_ID* = "/lol/clash/v1/tournaments/{tournamentId}"

  LEAGUE_CHALLENGER_BY_QUEUE* = "/lol/league/v4/challengerleagues/by-queue/{queue}"
  LEAGUE_GRANDMASTER_BY_QUEUE* = "/lol/league/v4/grandmasterleagues/by-queue/{queue}"
  LEAGUE_MASTER_BY_QUEUE* = "/lol/league/v4/masterleagues/by-queue/{queue}"
  LEAGUE_BY_SUMMONER* = "/lol/league/v4/entries/by-summoner/{encryptedSummonerId}"
  LEAGUE_BY_ID* = "/lol/league/v4/leagues/{leagueId}"
  LEAGUE_ENTRIES* = "/lol/league/v4/entries/{queue}/{tier}/{division}"
  LEAGUE_ENTRIES_PAGED* = "/lol/league/v4/entries/{queue}/{tier}/{division}?page={page}"
  LEAGUE_ENTRIES_EXP* = "/lol/league-exp/v4/entries/{queue}/{tier}/{division}"
  LEAGUE_ENTRIES_EXP_PAGED* = "/lol/league-exp/v4/entries/{queue}/{tier}/{division}?page={page}"

  STATUS_PLATFORM_DATA* = "/lol/status/v4/platform-data"

  STATUS_BY_ACCOUNT* = "/lol/summoner/v4/summoners/by-account/{encryptedAccountId}"
  STATUS_BY_NAME* = "/lol/summoner/v4/summoners/by-name/{summonerName}"
  STATUS_BY_PUUID* = "/lol/summoner/v4/summoners/by-puuid/{encryptedPUUID}"
  STATUS_BY_SUMMONER_ID* = "/lol/summoner/v4/summoners/{encryptedSummonerId}"
