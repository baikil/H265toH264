@echo off
title H265 to H264 - Select directory
echo Input the path of the directory containing the H265 .mp4 files
echo.
set /p "directory=Directory: "
set "directory=%directory:"=%"
for %%i in ("%directory%\*.mp4") do (
title H265 to H264 - Converting [%%i]
ffmpeg -i "%%i" -c:v libx264 -crf 18 -vf format=yuv420p -c:a copy "%%i.mkv"
set "name=%%i"&set "name=%name:.mp4=%"
ren "%%i.mkv" "%name%"
)
pause