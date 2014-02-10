@echo off
if "%PYENV_DEBUG%"==1 (
	@echo on
)


set print=""
set no_rehash=""
for %%s in (%*) do (
	echo %%s
	if %%s==- (
		set print=1
	)
	if %%s==--no-rehash (
		set no_rehash=1
	)
)

echo %print%
echo %no_rehash%

rem create shim dir if it doesn't exist
rem put the shim dir at the head of the path
setx PATH "%PYENV_HOME%/shims/;%PATH%"

:handle_arguments
echo %1
goto:eof
