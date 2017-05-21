#!/bin/bash
# strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

: ${REPOSITORY:=/srv/data}

# no auto upgrades
sed -Ee "/REPOSITORY=/c\REPOSITORY=\"${REPOSITORY}\"" -i /usr/bin/syncthing-acl.sh

exec /usr/bin/syncthing-acl.sh

