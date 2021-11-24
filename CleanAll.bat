:: Copyright (c) 2021 Maxime "mrouffet" ROUFFET. All Rights Reserved.
:: From MIT Repository: https://github.com/mrouffet/UE4-ScriptHelpers

@echo off

setlocal

:: Clear console.
cls


:: Kill Unreal Engine and Visual Studio processes.
echo Kill Unrean and Visual Studio proccesses...
taskkill /f /im UE4Editor.exe
taskkill /f /im devenv.exe


:: Wait for kills.
timeout 3 /nobreak


:: Backup local editor settings.
set lconfig=Windows WorldState

if exist Saved\Config (
	echo Backup local editor settings...
	mkdir Config_backup

	for %%a in (%lconfig%) do ( 
	   move Saved\Config\%%a Config_backup\%%a
	)
)


:: Clean Visual Studio temporary files
echo Clear Visual Studio's temporary files...

rmdir /s /q .vs
del /s /q *.sln


:: Clean Unreal Project temporary files.
echo Clear Unreal Project's temporary files...

rmdir /s /q Binaries
rmdir /s /q Intermediate
rmdir /s /q Saved
rmdir /s /q DerivedDataCache



:: Clean Unreal Project's Plugins temporary files.
echo Clear Unreal Plugins's temporary files...

for /D %%G in ("Plugins\*") do (
	rmdir /s /q %%G\Binaries
	rmdir /s /q %%G\Intermediate
)


:: Restore local editor settings
if exist Config_backup (
	echo Restore local editor settings...
	mkdir Saved
	move Config_backup Saved\Config
)

endlocal
