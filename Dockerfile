FROM uphy/novnc-alpine
RUN \
    # Install firefox
    apk --update --no-cache add firefox && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    # Append firefox entry to supervisord.conf
    cd /etc/supervisor/conf.d && \
    echo '[program:firefox]' >> supervisord.conf && \
    echo 'command=/usr/bin/firefox --no-remote' >> supervisord.conf && \
    echo 'autorestart=true' >> supervisord.conf
