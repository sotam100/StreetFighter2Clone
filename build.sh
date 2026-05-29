#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
UNITY_EXEC="/opt/unity/editor/Unity"
BUILD_PATH="$PROJECT_DIR/Build/WebGL"

mkdir -p "$BUILD_PATH"

"$UNITY_EXEC" \
  -batchmode \
  -nographics \
  -silent-crashes \
  -projectPath "$PROJECT_DIR" \
  -executeMethod BuildWebGL.BuildGame \
  -buildTarget WebGL \
  -quit \
  -logFile "$PROJECT_DIR/unity_build.log"

echo "WebGL build output is available at: $BUILD_PATH"
