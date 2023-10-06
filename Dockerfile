FROM docker.io/trafex/php-nginx:3.4.0

ENV bludit_content /var/www/html/bl-content
ENV bludit_url https://www.bludit.com/releases/bludit-3-15-0.zip

USER nobody

COPY docker-entrypoint.sh /

WORKDIR /tmp

RUN curl -o /tmp/bludit.zip ${bludit_url} && \
  unzip /tmp/bludit.zip && \
  cp -r bludit/* /var/www/html && \
  chown -R nobody:nobody /var/www/html && \
  chmod 755 ${bludit_content} && \
  sed -i "s/'DEBUG_MODE', FALSE/'DEBUG_MODE', TRUE/g" /var/www/html/bl-kernel/boot/init.php && \
  rm -f /tmp/bludit.zip

EXPOSE 8080

CMD ["/docker-entrypoint.sh"]
