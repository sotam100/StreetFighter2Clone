# StreetFighter2Clone Railway deployment

This repo is configured to build Unity WebGL and serve it through nginx.

## Deployment prep for Railway

1. Railway must build the container from this repository using `Dockerfile`.
2. Unity build requires a valid Unity license in CI. Set the following Railway environment variables before deploy:
   - `UNITY_LICENSE` — Base64-encoded Unity license file.
   - `UNITY_EMAIL` — optional Unity account email for activation.
   - `UNITY_PASSWORD` — optional Unity account password for activation.

> If you use a Unity license file instead of account activation, encode it with `base64` and store the result in `UNITY_LICENSE`.

## Local build flow

1. Build WebGL locally with Unity 2022.3.22f1.
2. The generated files will be placed in `Build/WebGL`.

## Docker build flow

The `Dockerfile` performs a two-stage build:

- `builder`: uses `unityci/editor:2022.3.22f1-webgl` to build the project
- `runtime`: copies `Build/WebGL` into an nginx image

## Notes

- If Railway cannot activate Unity in CI, build locally and deploy the generated `Build/WebGL` output as a static site instead.
- Use `railway up` or the Railway dashboard to point the project at this repository.
