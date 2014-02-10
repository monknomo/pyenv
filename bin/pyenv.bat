@echo off
setlocal
CD=%~dp0

if [%1]==[] goto help_command
if "%1"=="--debug" (
	@echo on
	echo "debug on"
	if [%2]==[] goto help_command
	else set CMD=%2
) else (
	set CMD=%1
)

if %CMD%=="-h" goto help_command
if %CMD%=="--help" goto help_command 
if %CMD%=="-v" goto version_command
if exist %CMD%.bat (
	goto wildcard_command
) else (
	goto bad_command
)

:bad_command
echo pyenv command not recognized
goto help_command

:wildcard_command
call %CMD%
exit /b 0

:help_command
call pyenv---version
call pyenv-help
exit /b 0

:version_command
call pyenv---version
exit /b 0

:error
echo Failed with error#%errorlevel%
exit /b %errorlevel%