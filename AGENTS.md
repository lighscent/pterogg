# PteroGG — Pterodactyl Node.js Eggs

Multi-version Pterodactyl egg + Docker image repo for Node.js (24, 25, 26).

## Repo structure

```
egg-nodejs.json        — Consolidated PTDL_v2 egg with docker_images for all 3 versions
nodejs_24/   nodejs_25/   nodejs_26/
  Dockerfile            — FROM node:<N>-slim, installs common Debian utils, creates `container` user
  entrypoint.sh         — Resolves {{VAR}} Pterodactyl startup placeholders, execs the command
```

- `.dockerignore` whitelists only `nodejs_*/`, Dockerfiles, entrypoints, and `.github/`
- `egg-nodejs.json` exports `docker_images` mapping each version to `ghcr.io/pterogg/pterogg:nodejs_<N>`

## CI

`.github/workflows/build.yml` — on push to `main`, matrix-builds all 3 versions and pushes to ghcr.io.

## Adding a new Node.js version

1. Copy an existing `nodejs_<N>/` dir to `nodejs_<M>/`
2. Update `Dockerfile`: `FROM node:<M>-alpine3.21` and LABEL version
3. Update `egg-nodejs.json`: name, description, docker_images tag, installation container image
4. Add `<M>` to the build matrix in `.github/workflows/build.yml`

## Variables (per egg)

| Egg variable    | Env         | Default                    |
|-----------------|-------------|----------------------------|
| Startup Command | STARTUP_CMD | `node index.js`            |
| Install Command | INSTALL_CMD | `npm install --production` |
| Timezone        | TZ          | `UTC`                      |

## Dev workflow

The egg JSONs are panel-generated; hand-edits are overwritten on re-export. Treat them as outputs, not sources — prefer changing Dockerfiles or entrypoints instead.
