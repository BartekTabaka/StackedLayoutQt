@echo off
setlocal

cd /d "%~dp0.." || goto :error

set "buildDir=build"
set "qtDir=C:\Qt\6.12.0\msvc2022_64"
set "exeName=StackedLayoutQt.exe"
set "exePath=%buildDir%\Debug\%exeName%"
set "deployTool=%qtDir%\bin\windeployqt.exe"

echo.
echo ========================
echo Building Debug...
echo ========================

cmake --build "%buildDir%" --config Debug

if errorlevel 1 goto :error

echo.
echo ========================
echo Checking executable...
echo ========================

if not exist "%exePath%" (
    echo ERROR: Executable not found: %exePath%
    goto :error
)

if not exist "%deployTool%" (
    echo ERROR: Qt deployment tool not found: %deployTool%
    goto :error
)

echo.
echo ========================
echo Deploying Qt Debug...
echo ========================

"%deployTool%" --debug "%exePath%"

if errorlevel 1 goto :error

echo.
echo ========================
echo BUILD AND DEPLOY SUCCESS!
echo ========================
echo.
goto :end

:error
echo.
echo ========================
echo BUILD OR DEPLOY FAILED!
echo ========================

:end
echo.
pause
endlocal
