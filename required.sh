CONFIG_DIR=~/.user-config


BINARY_DIR="$CONFIG_DIR/.bin"


# Get script path depending on shell
if [ -n "$BASH_SOURCE" ]; then
  SCRIPT_PATH="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
  SCRIPT_PATH="${(%):-%N}"
else
  echo "Unsupported shell" >&2
  exit 1
fi
__project_dir="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"


if [ ! -L "$CONFIG_DIR" ] || [ ! -e "$CONFIG_DIR" ]; then
    echo "Symlink does not exist or is broken, creating new one"
    ln -s "$__project_dir" "$CONFIG_DIR"
fi

if [ ! -d "$BINARY_DIR" ]; then
    mkdir "$BINARY_DIR"
fi