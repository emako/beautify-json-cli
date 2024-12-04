@echo off
setlocal

set "ARCH=%PROCESSOR_ARCHITECTURE%"

if "%ARCH%"=="AMD64" (
  set "DIR=..\beautify-json-cli\bin\win-x64"
) else if "%ARCH%"=="ARM64" (
  set "DIR=..\beautify-json-cli\bin\win-arm64"
) else if "%ARCH%"=="x86" (
  set "DIR=..\beautify-json-cli\bin\win-x86"
) else (
  echo Unsupported architecture: %ARCH%
  exit /b 1
)

if exist "%DIR%\beautify-json.exe" (
  "%DIR%\beautify-json.exe" %*
) else (
  echo beautify-json not found in the selected directory.
  exit /b 1
)

endlocal
