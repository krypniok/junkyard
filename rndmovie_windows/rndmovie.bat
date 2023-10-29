@echo off
setlocal enabledelayedexpansion

set "length=3"
for /f %%A in ('cd') do set "script_dir=%%A"

:loop
for /r %%F in (*) do (
  set "film=%%F"
  
  ffprobe -i "!film!" -show_entries format=duration -v quiet -of csv="p=0" || goto :continue

  for /f %%D in ('ffprobe -i "!film!" -show_entries format=duration -v quiet -of csv="p=0"') do set "duration=%%D"
  set /a "duration=!duration:.=!"

  if !duration! lss 1 (
    goto :continue
  )

  set /a "percent=duration / 100 * 25"
  set /a "rndl=1 + (!random! %% duration) - percent * 2"
  set /a "rnds=percent + (!random! %% rndl)"
  set /a "wait=rndl / 4"
  set /a "len=3 + (!random! %% length)"

  set "startzeit_file=!script_dir!\startzeit.txt"
  for /f %%P in ("!film!") do echo Dateiname: %%~fP > "!startzeit_file!"
  echo Startzeit: !rnds! >> "!startzeit_file!"

  start "" "mpv" "!film!" --start=!rnds! --length=!len! --fullscreen >nul 2>&1

  timeout /t !wait! /nobreak >nul

  :continue
)

goto :loop

