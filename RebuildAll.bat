:: Copyright (c) 2021 Maxime "mrouffet" ROUFFET. All Rights Reserved.
:: From MIT Repository: https://github.com/mrouffet/UE4-ScriptHelpers

@echo off

setlocal EnableDelayedExpansion

:: Clear console.
cls


:: Clean all generated files.
call CleanAll.bat


:: Build & Open Unreal Engine project.

:: Query project name from uproject file.
:: use %%~nf instead of %%f to remove extension from name.
for %%f in (*.uproject) do set projectName=%%~nf

:: Query Unreal Engine project generator process (same as right click on .upoject file -> "Generate Visual Studio project files").
:: Source: https://answers.unrealengine.com/questions/14280/generate-vs-project-files-by-command-line.html 
powershell -command "& { (Get-ItemProperty 'Registry::HKEY_CLASSES_ROOT\Unreal.ProjectFile\shell\rungenproj' -Name 'Icon' ).'Icon' }" > gen_temp.txt

:: Set registery output in variable.
set /p gen=<gen_temp.txt
del /q gen_temp.txt


:: Generate Visual Studio project files.
echo Generate %projectName% Visual Studio project files...
%gen% /projectfiles "%cd%\%projectName%.uproject"

:: Launch Visual Studio.
start %projectName%.sln

:: Launch Unreal Engine Editor.
echo Launch %projectName% project...
%gen% /editor "%cd%\%projectName%.uproject"

endlocal
