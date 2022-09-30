FROM ubuntu:jammy
ENV XDG_RUNTIME_DIR /tmp/runtime-root

RUN apt-get update && apt-get -y --no-install-recommends install \
   curl ca-certificates xvfb qtbase5-dev qtbase5-private-dev libqt5svg5-dev qttools5-dev-tools zlib1g-dev qtdeclarative5-dev qtdeclarative5-private-dev qbs && \
   rm -rf /var/lib/apt/lists/*

RUN curl -L -o tiled.AppImage https://github.com/mapeditor/tiled/releases/download/v1.9.2/Tiled-1.9.2_Linux_x86_64.AppImage && \
  mv tiled.AppImage /usr/bin/tiled.AppImage && chmod +x /usr/bin/tiled.AppImage
COPY tiled /usr/bin/tiled
  
ENTRYPOINT ["tiled"]
CMD ["--help"]