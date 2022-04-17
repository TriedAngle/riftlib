const
  GAMEFLOW_BASE* = "/lol-gameflow"
  GAMEFLOW_SESSION* = "/lol-gameflow/v1/session"

  CHAMPSELECT_BASE* = "/lol-champ-select/v1"
  CHAMPSELECT_SUMMONER_BY_SLOT* = "/lol-champ-select/v1/summoners/{slotId}" # GET
  CHAMPSELECT_SUMMONER_BASE* = "/lol-champ-select/v1/summoners/"
  CHAMPSELECT_SESSION* = "/lol-champ-select/v1/session"

  SUMMONER_BASE* = "/lol-summoner/v1"
  SUMMONER_SUMMONER_BY_ID* = "/lol-summoner/v1/summoners/{id}" # GET
  SUMMONER_CURRENT* = "/lol-summoner/v1/current-summoner" # GET

  CHAT_BASE* = "/lol-chat/v1"
  CHAT_FRIENDS* = "/lol-chat/v1/friends" # GET
  CHAT_FRIENDS_BY_ID* = "/lol-chat/v1/friends/{id}" # GET
  CHAT_ME* = "/lol-chat/v1/me" # GET, POST

  END_OF_GAME_BASE* = "/lol-end-of-game/v1"
  END_OF_GAME_REPORTED_PLAYERS* = "/lol-end-of-game/v1/reported-players" # GET

  LOBBY_BASE* = "/lol-lobby/v2"
  LOBBY_MEMBERS* = "/lol-lobby/v2/lobby/members" # GET
  LOBBY_INVITATIONS* = "/lol-lobby/v2/lobby/invitations" # GET, POST
  LOBBY_MEMBERS_KICK* = "/lol-lobby/v2/lobby/members/{id}/kick"
  LOBBY_MEMBERS_GRANT_INVITE* = "/lol-lobby/v2/lobby/members/{id}/grant-invite"
  LOBBY_MEMBERS_PROMOTE* = "/lol-lobby/v2/lobby/members/{id}/promote"
  LOBBY_SEARCH* = "/lol-lobby/v2/lobby/matchmaking/search" # POST, DELETE
  LOBBY_LOBBY* = "/lol-lobby/v2/lobby" # GET, DELETE, POST
  LOBBY_POSITION_PREF* = "/lol-lobby/v2/lobby/members/localMember/position-preferences" # PUT

  LOBBY_TEAMBUILDER_BASE* = "/lol-lobby-team-builder/v1"
  LOBBY_TEAMBUILDER_MATCHMAKING* = "/lol-lobby-team-builder/v1/matchmaking"

  LOGIN_BASE* = "/lol-login/v1"
  LOGIN_DODGE_LOBBY* = "/lol-login/v1/session/invoke?destination=lcdsServiceProxy&method=call&args=[\"\", \"teambuilder-draft\",\"quitV2\", \"\"]"

  MATCHMAKING_BASE* = "/lol-matchmaking/v1"
  MATCHMAKING_SEARCH* = "/lol-matchmaking/v1/search"
  MATCHMAKING_ACCEPT* = "/lol-matchmaking/v1/ready-check/accept" # POST
  MATCHMAKING_DECLINE* = "/lol-matchmaking/v1/ready-check/decline" # POST

  RIOTCLIENT_BASE* = "/riotclient/v1"
  RIOTCLIENT_LAUNCH_UX* = "/riotclient/launch-ux"
  RIOTCLIENT_KILL_UX* = "/riotclient/kill-ux"

  RANKED_BASE* = "/lol-ranked/v1"
  RANKED_STATS* = "/lol-ranked/v1/ranked-stats/{puuid}"

  PERKS_BASE* = "/lol-perks/v1/"
  PERKS_PAGES* = "/lol-perks/v1/pages"
  PERKS_PAGE* = "/lol-perks/v1/pages/{id}"
  PERKS_CURRENT* = "/lol-perks/v1/currentpage" # GET , POST
