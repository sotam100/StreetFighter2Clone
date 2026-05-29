# Build Unity WebGL inside a Unity CI image, then serve with nginx.
FROM unityci/editor:2022.3.22f1-webgl as builder

WORKDIR /project
COPY . .

RUN /opt/unity/editor/Unity \
    -batchmode \
    -nographics \
    -silent-crashes \
    -projectPath /project \
    -executeMethod BuildWebGL.BuildGame \
    -buildTarget WebGL \
    -quit \
    -logFile /tmp/unity_build.log

FROM nginx:stable-alpine
COPY --from=builder /project/Build/WebGL /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
