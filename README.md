# StreetFighter2Clone Railway Deployment

This repo deploys a pre-built Unity WebGL game through nginx on Railway.

## Deployment Flow

1. **Build locally** – Generate WebGL in Unity to `Build/WebGL/`
2. **Commit & push** – Add the build folder to git
3. **Deploy to Railway** – Railway builds the Docker image and serves static files

## Local Build

Open the project in Unity 2022.3.22f1 and build to WebGL. Files will be generated in `Build/WebGL/`.

## Docker Deployment

The `Dockerfile` is a single-stage build that:
- Copies the pre-built WebGL folder
- Runs nginx to serve static files on port 80

## Setup in Railway

1. Connect this repository to Railway
2. Railway will auto-detect the Dockerfile and deploy
3. Your WebGL app will be available at the Railway URL

No environment variables or license keys needed!

