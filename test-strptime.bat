@echo off
::setlocal enabledelayedexpansion
set "testfile=%~n0.txt"
set "testall=0"
set "testok=0"
set "testerr=0"
for /f "tokens=1,2,* delims=	" %%i in (%testfile%) do (
	call:strptimecall %%i %%j "%%k"
	if errorlevel 1 echo.%%i	%%j	%%k
	set /a "testall=testall+1"
)
echo All/ok/err: %testall%/%testok%/%testerr%
exit /b

:: %1 - fromat
:: %2 - test string
:: %3 - result: ok/error year month day hour min sec
:strptimecall
for /f "tokens=1-7 delims= " %%a in ("%~3") do (
::echo.            reference: year=%%b month=%%c mday=%%d hour=%%e min=%%f sec=%%g result=%%a
	set "res=%%a"
	set "year=%%b"
	set "month=%%c"
	set "mday=%%d"
	set "hour=%%e"
	set "min=%%f"
	set "sec=%%g"
)

for /f "tokens=1-6 delims=.:, " %%a in ('test-strptime.exe %1 %2') do (
	if "%res%" equ "error" if "%%b" equ "error" (goto:testok)
	if "%res%" equ "ok" if "%year%" equ "%%a" if "%month%" equ "%%b" if "%mday%" equ "%%c" if "%hour%" equ "%%d" if "%min%" equ "%%e" if "%sec%" equ "%%f" (goto:testok)
	echo.Error strptime return: year=%%a month=%%b mday=%%c hour=%%d min=%%e sec=%%f
	echo.            reference: year=%year% month=%month% mday=%mday% hour=%hour% min=%min% sec=%sec% result=%res%
	set /a "testerr=testerr + 1"
)
exit /b 1
:testok
set /a "testok=testok + 1"
exit /b 0
