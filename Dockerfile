FROM n8nio/n8n:latest
USER root
RUN mkdir -p /home/node/.n8n-files && chown -R node:node /home/node/.n8n-files
RUN wget -q https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -P /tmp && \
    tar xf /tmp/ffmpeg-release-amd64-static.tar.xz -C /tmp && \
    mv /tmp/ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ && \
    mv /tmp/ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ && \
    rm -rf /tmp/ffmpeg* && \
    wget -q -O /usr/local/bin/curl https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64 && \
    chmod +x /usr/local/bin/curl
RUN mkdir -p /home/node/.n8n/nodes && cd /home/node/.n8n/nodes && npm install n8n-nodes-upload-post
USER node
