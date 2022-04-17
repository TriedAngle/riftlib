import std/[httpclient, json, strformat, times]
var client = newHttpClient()

let data = client.getContent("https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/queues.json").parseJson


for key in data.keys:
  let name = data[key]["name"]
  echo fmt"{key} => {name}"