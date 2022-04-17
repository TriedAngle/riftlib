import std/options
import ./socket
import ./lcu
from ./consts import Queue

type
  EventType* {.pure.} = enum
    Create
    Update
    Delete
    Other # TODO: match other
  
  LeagueEventKind* {.pure.} = enum
    Queue
    Lobby
    Friend
    Gameflow
    ChampSelect

  LeagueEvent* = object
    eventType*: Option[EventType]
    case kind*: LeagueEventKind
    of LeagueEventKind.Queue: queue: Option[QueueEvent]
    of LeagueEventKind.Lobby: lobby: Option[LobbyEvent]
    of LeagueEventKind.Friend: friend: Option[FriendEvent]
    of LeagueEventKind.Gameflow: discard
    of LeagueEventKind.ChampSelect: discard

  QueueEvent* = object
    dodgeData*: Option[DodgeData]
    errors*: Option[seq[string]]
    estimatedQueueTime*: Option[float64]
    isCurrentlyInQueue*: Option[bool]
    lobbyId*: Option[string]
    lowPriorityData*: Option[LowPriorityData]
    queueId*: Option[Queue]
    readyCheck*: Option[ReadyCheck]
    searchState*: Option[SearchState]
    timeInQueue*: Option[float64]

  LobbyEvent* = Lobby
  FriendEvent* = Friend

  GameFlowEvent* = object
    gameClient*: Option[GameClientData]
    gameData*: Option[GameData]
    gameDodge*: Option[DodgeData]
    map*: Option[GameFlowMapData]
    phase*: Option[GameFlowPhase]