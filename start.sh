#!/bin/bash
# strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

exec /usr/bin/syncthing-acl.sh

