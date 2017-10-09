FROM jbbodart/alpine-novnc
RUN \
    # Install firefox
    apk --update --no-cache add dbus xterm firefox-esr fontconfig ttf-freefont && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    # create links for volume
    mkdir /data && \
    ln -s /root/.mozilla /data/Mozilla && \
    ln -s /root/Downloads /data/Downloads && \
    # Append firefox entry to supervisord.conf
    cd /etc/supervisor/conf.d && \
    echo '[program:firefox]' >> supervisord.conf && \
    echo 'command=/usr/bin/firefox --no-remote' >> supervisord.conf && \
    echo 'autorestart=true' >> supervisord.conf

VOLUME /data
