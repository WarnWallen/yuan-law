@echo off
chcp 65001 >nul
title 元代断案官
set BASE=<你的API地址,以/v1结尾>
set KEY=<你的密钥>
echo ========================================
echo   元代断案官 —— 路府推官拟判
echo   输入案情后回车问案；输入 exit 退堂。
echo ========================================
echo.
:loop
set Q=
set /p Q=案情: 
if "%Q%"=="exit" goto end
if "%Q%"=="" goto loop
curl.exe -s -X POST "%BASE%/chat/completions" -H "Authorization: Bearer %KEY%" -H "Content-Type: application/json" -d "{\"messages\":[{\"role\":\"user\",\"content\":\"%Q%\"}]}"
echo.
echo ----------------------------------------
goto loop
:end
echo 退堂。
