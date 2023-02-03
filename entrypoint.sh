#! /usr/bin/env bash
set -euo pipefail

# GitHub overrides $HOME. Set it back to the home directory of our `app` user,
# otherwise the call to `git config` fails.
export HOME=/home/app

# Mark the current directory as safe. If we don't do this, git commands fail
# because the source in $PWD is owned by a different user than our `app` user.
git config --global --add safe.directory "$PWD"

args=("$@")
ggshield secret scan ${args[@]} ci
