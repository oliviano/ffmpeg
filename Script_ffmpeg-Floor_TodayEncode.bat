@echo off
SETLOCAL ENABLEEXTENSIONS
REM So that variable aren't shared between sessions

echo Starting FFMPEG ENCODE OF NIWA IMG SEQ >> log_Encode.txt
echo %date% >> log_Encode.txt

REM This sets the date Variable to today
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set myDate=%%a%%b%%c)

echo Today Date is: %myDate% >> log_Encode.txt
echo ----------------------------- >> log_Encode.txt
echo -----------------------------

SET infolder=D:\10_FtpDownloads\
SET outfolder=D:\20_MediaEncodes\

SET infilename=Particles_%myDate%_%%03d.jpg
SET outfilename=Particles_%myDate%_HAPQ.mov

echo file name string is %infilename% >> log_Encode.txt


REM disable -n switch to allow for overwriting
ffmpeg -n -i "%infolder%%infilename%" -vf scale=3840:2160 -c:v hap -format hap_q -chunks 4 "%outfolder%%outfilename%"

echo ----------------------------- >> log_Encode.txt
echo ----------------------------- >> log_Encode.txt

echo HAP Successfully Encoded
timeout /t 10