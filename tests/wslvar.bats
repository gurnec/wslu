#!/usr/bin/env bats

#wslvar testing
@test "wslvar - No parameter" {
  run out/wslvar
  [ "$status" -eq 21 ]
}

@test "wslvar - Help" {
  run out/wslvar --help
  [ "${lines[0]}" = "wslvar - Component of Windows 10 Linux Subsystem Utility" ]
  [ "${lines[1]}" = "Usage: wslvar (-s|-l) ...NAME..." ]
  [ "${lines[2]}" = "wslvar (-h|-v|-S|-L)" ]
}

@test "wslvar - Help - Alt." {
  run out/wslvar -h
  [ "${lines[0]}" = "wslvar - Component of Windows 10 Linux Subsystem Utility" ]
  [ "${lines[1]}" = "Usage: wslvar (-s|-l) ...NAME..." ]
  [ "${lines[2]}" = "wslvar (-h|-v|-S|-L)" ]
}
@test "wslvar - System Variables" {
  run out/wslvar -s ProgramData
  [ "${lines[0]}" = "C:\ProgramData" ]
}

@test "wslvar - /w parameter - No Input" {
  run out/wslvar -s
  [ "${status}" -eq 21 ]
}