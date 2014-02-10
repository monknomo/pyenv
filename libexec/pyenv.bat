if %1=="--debug" (
	setx /M PYENV_DEBUG 1
	shift
)

if "%PYENV_ROOT"=="" (
	setx /M PYENV_ROOT = %ALLUSERSPROFILE%\pyenv\
	
)else (
	if %PYENV_ROOT:~-1%==\ (
		setx /M PYENV_ROOT "%PYENV_ROOT%"
	)else (
		setx /M PYENV_ROOT "%PYENV_ROOT%\"
	)
)