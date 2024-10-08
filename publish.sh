#!/bin/sh

# Create thumbnail
magick -density 144 "template/main.pdf[0]" thumbnail.png

# Check if at least 3 arguments are provided (local fork, package name, package version)
if [ "$#" -lt 3 ]; then
  # add output to cli which explains the 3 arguments
  echo "Error: Missing arguments. Please provide exactly 3 arguments:"
  echo "1 – the path to the local fork of the package repository"
  echo "2 – the package name"
  echo "3 – the package version."
  exit 1
fi


# Assign the first argument as the path to the local fork of the package repository
FORK_PATH=$1

# Assign the second argument as the package name
PACKAGE_NAME=$2

# Assign the third argument as the package version
PACKAGE_VERSION=$3

TARGET_DIR="$FORK_PATH/packages/preview/$PACKAGE_NAME/$PACKAGE_VERSION"

# clean target directory
rm -rf "$TARGET_DIR"

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Notification: Directory $TARGET_DIR does not exist. Creating directory.."
  mkdir -p "$TARGET_DIR"
fi

# Create a list of files or directories to copy
paths=(
  "template"
  "tud-presentation"
  "LICENSE"
  "README.md"
  "typst.toml"
  "thumbnail.png"
)

# Iterate over the list of paths
for path in "${paths[@]}"; do
  # Check if the path exists in the source directory
  if [ -e "$path" ]; then
    # Check if path is a directory
    if [ -d "$path" ]; then
      echo "Copying directory $path ..."
      # Copy the directory from the source to the target directory
      cp -r "$path" "$TARGET_DIR"
      continue
    else
    echo "Copying file $path ..."
    # Copy the file from the source to the target directory
    cp "$path" "$TARGET_DIR"
    fi
  else
    echo "Warning: File $path not found in working directory."
  fi
done

echo "Files copied successfully."