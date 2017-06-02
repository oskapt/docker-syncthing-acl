# docker-syncthing-acl

This container will install and run this modified version of [syncthing-acl](https://github.com/oskapt/syncthing-acl) in a Docker container. It is designed to run as a sidekick to [docker-syncthing](https://hub.docker.com/r/monachus/syncthing/) within [Rancher](https://github.com/rancher/rancher).

## Operation

1. Create a Syncthing service. It should mount a config directory and a share directory. The default share is `/srv/data` and the default config location is `/srv/config`.
2. Add this container as a sidekick, mounting the volumes from the main Syncthing service
3. After starting the service, use Syncthing to share `/srv/data/.acls` between hosts where syncthing-acl is running.

The containers will use inotify to detect file and folder changes. These are written to the `.acls` share, and when files are replicated by Syncthing, this service comes by afterward and sets permissions.
