#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
  if [[ "$(uname)" == "Linux" ]]; then
    DIR="$SCRIPT_DIR/../beautify-json-cli/bin/linux-x64"
  elif [[ "$(uname)" == "Darwin" ]]; then
    DIR="$SCRIPT_DIR/../beautify-json-cli/bin/osx-x64"
  fi
elif [[ "$ARCH" == "aarch64" ]]; then
  if [[ "$(uname)" == "Linux" ]]; then
    DIR="$SCRIPT_DIR/../beautify-json-cli/bin/linux-arm64"
  elif [[ "$(uname)" == "Darwin" ]]; then
    DIR="$SCRIPT_DIR/../beautify-json-cli/bin/osx-arm64"
  fi
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

if [[ -f "$DIR/beautify-json" ]]; then
  "$DIR/beautify-json" "$@"
else
  echo "beautify-json not found in the selected directory."
  exit 1
fi
