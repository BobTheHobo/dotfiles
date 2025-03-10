#!/bin/bash

ENV_FILE=".env"
SCRIPT="dotfile_install.ps1"
GIT_DIR=$HOME/dotfiles/windows/ #assumes dotfiles is at $HOME

# Load .env
# -f = True if file exists and is regular
if [ -f "$ENV_FILE" ]; then 
  # grep from $ENV_FILE, skipping comments (-v "^#")
  export $(grep -v "^#" "$ENV_FILE" | xargs )
else
  echo "No .env file found"
  exit 1
fi

# Check variables are set
# -z = true if len str is 0
if [ -z "$WINDOWS_USERNAME" ]; then
  echo "Missing windows username"
  exit 1
fi

if [ -f "$HOME/dotfiles/windows$SCRIPT" ]; then
  echo "PS Install script not found!"
  exit 1
fi

# Define paths
WINDOWS_TARGET="/mnt/c/Users/$WINDOWS_USERNAME/Documents"
WIN_SCRIPT="$WINDOWS_TARGET/$SCRIPT"


# Check if symlink exists
# -L = file exists and is symlink, -e = file exists
# if [ -L $WINDOWS_TARGET ] || [ -e "$WINDOWS_TARGET$SCRIPT" ]; then
if [ -f $WIN_SCRIPT ]; then
  echo "Symlink or file already exists at $WINDOWS_TARGET. Overwriting..."
  rm -f $WIN_SCRIPT
fi


# Make symlink
echo "gitdir: $GIT_DIR$SCRIPT windows: $WINDOWS_TARGET"
cp $GIT_DIR$SCRIPT $WINDOWS_TARGET

LOCATION=""
# Execute powershell as admin
WIN_PATH=$(wslpath -w "$WINDOWS_TARGET/$SCRIPT")
echo $WIN_PATH
# powershell.exe -Command "&{Start-Process powershell.exe -Verb RunAs -ArgumentList '-ExecutionPolicy ByPass -NoExit -Command Set-Location $WINDOWS_TARGET'; & $WIN_PATH }"
# powershell.exe -Command "&{Start-Process powershell.exe -Verb RunAs -ArgumentList '-ExecutionPolicy ByPass -NoExit -File $WIN_PATH $GIT_DIR' }"

powershell.exe -Command "&{Start-Process powershell.exe -Verb RunAs -ArgumentList '-ExecutionPolicy ByPass -NoExit -Command Set-Location -Path $WINDOWS_TARGET'; & $WIN_PATH}"; 
