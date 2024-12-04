# Enable strict mode for safety
Set-StrictMode -Version Latest

# Determine the processor architecture
$ARCH = $ENV:PROCESSOR_ARCHITECTURE

# Set the appropriate directory based on architecture
if ($ARCH -eq "AMD64") {
    $DIR = Join-Path -Path $PSScriptRoot -ChildPath "..\beautify-json-cli\bin\win-x64"
} elseif ($ARCH -eq "ARM64") {
    $DIR = Join-Path -Path $PSScriptRoot -ChildPath "..\beautify-json-cli\bin\win-arm64"
} elseif ($ARCH -eq "x86") {
    $DIR = Join-Path -Path $PSScriptRoot -ChildPath "..\beautify-json-cli\bin\win-x86"
} else {
    Write-Error "Unsupported architecture: $ARCH"
    exit 1
}

# Check if the executable exists in the determined directory
$EXE_PATH = Join-Path -Path $DIR -ChildPath "beautify-json.exe"
if (Test-Path $EXE_PATH) {
    # Invoke the executable with all passed arguments
    & $EXE_PATH @args
} else {
    Write-Error "beautify-json not found in the selected directory."
    exit 1
}
