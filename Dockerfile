FROM jbbodart/alpine-novnc
RUN \
    # Install firefox
    apk --update --no-cache add dbus xterm firefox-esr fontconfig ttf-freefont && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    # create links for volume
    mkdir /data && \
    cd /etc/supervisor/conf.d && \
    # create links for volume
    echo '[program:start]' >> supervisord.conf && \
    echo "command=bash -c 'ln -s /root/.mozilla /data/Mozilla && ln -s /root/Downloads /data/Downloads'" >> supervisord.conf && \
    echo 'startsecs=0' >> supervisord.conf && \
    echo 'autorestart=false' >> supervisord.conf && \
    # Append firefox entry to supervisord.conf
    echo '[program:firefox]' >> supervisord.conf && \
    echo "command=bash -c 'sleep 5 && /usr/bin/firefox --no-remote'" >> supervisord.conf && \
    echo 'autorestart=true' >> supervisord.conf

VOLUME /data
