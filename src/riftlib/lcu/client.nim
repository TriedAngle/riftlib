import ./process
import ../types/consts
import ../types/lcu
import ../routes/lcu as routes

import std/[net, options, httpclient, marshal, asyncnet, asyncdispatch, strutils, strformat, json, base64]
import ws

type
  Info* = ref object
    pid: int
    port: string
    code: string
    riotPort: string
    path: string
    token: string
    riotToken: string
    region: Region
    locale: string
  
  LClient* = ref object
    info*: Option[Info]
    http*: AsyncHttpClient
    sock*: Option[WebSocket]

  GameFlow = object
    c: LClient
  ChampSelect = object
    c: LClient
  Chat = object
    c: LClient
  EndOfGame = object
    c: LClient
  Lobby = object
    c: LClient
  LobbyTeamBuilder = object
    c: LClient
  Login = object
    c: LClient
  Matchmaking = object
    c: LClient
  RiotClient = object
    c: LClient
  Ranked = object
    c: LClient
  Perks = object
    c: LClient

proc defaultLog() = discard

proc newInfo*(pid: int, args: seq[string]): Info =
  result = Info()
  result.path = args[0].strip(chars = {'\x00'})
  result.riotToken = args[1].split("=")[1].strip(chars = {'\x00'})
  result.riotPort = args[2].split("=")[1].strip(chars = {'\x00'})
  result.region = regionLCUFrom(args[5].split("=")[1].strip(chars = {'\x00'}))
  result.locale = args[6].split("=")[1].strip(chars = {'\x00'})
  result.token = args[7].split("=")[1].strip(chars = {'\x00'})
  result.port = args[10].split("=")[1].strip(chars = {'\x00'})
  result.code = encode(fmt"riot:{result.token}")

proc newHttpClient(info: Info): AsyncHttpClient =
  result = newAsyncHttpClient(sslContext=newContext(verifyMode=CVerifyNone))
  result.headers = newHttpHeaders({ "Authorization": fmt"Basic {info.code}", "Content-Type": "application/json"})

proc newClient*(): LClient =
  result = LClient()
  let maybeProcess = findProcessId()
  if maybeProcess.isNone(): return
  let (pid, args) = maybeProcess.get()
  let info = newInfo(pid, args)
  result.info = some info
  result.http = newHttpClient(info)

proc updateInfo*(client: LClient) =
  let maybeProcess = findProcessId()
  if maybeProcess.isNone(): 
    client.info = none Info
  let (pid, args) = maybeProcess.get()
  let info = newInfo(pid, args)
  client.info = some info
  client.http = newHttpClient(info)

proc port*(client: LClient): string =
  client.info.get().port

proc getRaw*(c: LClient, url: string): Future[JsonNode] {.async.} =
  let url = fmt"https://127.0.0.1:{c.port}{url}"
  let response = await c.http.getContent(url)
  result = response.parseJson()

proc get*[T](c: LClient, url: string): Future[T] {.async.} =
  let json = await getRaw(c, url)
  result = to(json, T)


proc gameFlow*(c: LClient): GameFlow =
  result = GameFlow(c: c)
proc champSlect*(c: LClient): ChampSelect =
  result = ChampSelect(c: c)
proc chat*(c: LClient): Chat =
  result = Chat(c: c)
proc endOfGame*(c: LClient): EndOfGame =
  result = EndOfGame(c: c)
proc lobby*(c: LClient): Lobby =
  result = Lobby(c: c)
proc lobbyTeamBuilder*(c: LClient): LobbyTeamBuilder =
  result = LobbyTeamBuilder(c: c)
proc login*(c: LClient): Login =
  result = Login(c: c)
proc matchmaking*(c: LClient): Matchmaking =
  result = Matchmaking(c: c)
proc riotClient*(c: LClient): RiotClient =
  result = RiotClient(c: c)
proc ranked*(c: LClient): Ranked =
  result = Ranked(c: c)
proc perks*(c: LClient): Perks =
  result = Perks(c: c)

proc session(g: GameFlow): Future[Session] {.async.} =
  result = await g.c.get(routes.GAMEFLOW_SESSION)
  

when isMainModule:
  echo "Testing: LCU Client"
  let client = newClient()
  echo waitFor client.gameFlow().session()