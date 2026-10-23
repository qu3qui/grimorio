#!/usr/bin/env bash
# Symlink every skill in claude/skills/ into ~/.claude/skills/ so edits here apply everywhere.
set -euo pipefail

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
dest_dir="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$dest_dir"

for skill in "$src_dir"/*/; do
  name="$(basename "$skill")"
  target="$dest_dir/$name"
  if [ -L "$target" ]; then
    if [ "$(readlink "$target")" = "${skill%/}" ]; then
      echo "ok       $name (already linked)"
      continue
    fi
    echo "relink   $name"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "skip     $name ($target exists and is not a symlink — remove it to install)"
    continue
  else
    echo "link     $name"
  fi
  ln -s "${skill%/}" "$target"
done
