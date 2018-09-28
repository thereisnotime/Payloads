@echo off
color 0a
title Some mad hacking skills are being used...
echo Please wait, hacking your computer...
:: Variables
SET imagesrc=https://raw.githubusercontent.com/thereisnotime/Payloads/master/HACKEDBG.bmp
SET imagebmp=%temp%\hacked.bmp
:: Download image
START /B /wait "" "cmd /c bitsadmin.exe /transfer GETTINGHACKS... %imagesrc% %imagebmp%"
:: Set wallpaper
:checkagain
if exist "%imagebmp%" (
	echo Image found...
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 0 /f >nul
	reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d 0 /f >nul
	reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imagebmp%" /f >nul
	echo Evil deed is done.
	%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
	rem RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
) else (
	echo Image not found...
    goto:checkagain
)
echo Hacked. Have a nice day
pause
