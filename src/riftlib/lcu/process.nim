import std/[sequtils, strformat, strutils, options]
import psutil/psutil_linux

from slicerator import zipIter

proc findProcessId*(pidName: string = "LeagueClientUx", argName: string = "LeagueClientUx.exe"): Option[tuple[id: int, args: seq[string]]] =
  let pids = pids()
  let names = pid_names(pids)

  for pid, name in zipIter(pids.items, names.items):
    if name.contains(pidName):
      let cmdLine = pid_cmdline(pid)
      let args = cmdLine.split("--")
      if args.len() > 0 and args[0].contains(argName):
        result = some (pid, args)
