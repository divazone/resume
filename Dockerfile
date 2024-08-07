FROM ubuntu:22.04

RUN apt-get -qq update && \
  apt-get install -y make pdftk xfonts-base xfonts-75dpi \
        chromium-browser fonts-noto language-pack-zh-hant \
        fonts-wqy-microhei ttf-wqy-microhei fonts-wqy-zenhei \
        ttf-wqy-zenhei fonts-noto-cjk wkhtmltopdf pandoc make pdftk

RUN fc-cache -f -v

