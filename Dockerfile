FROM vulnerables/web-dvwa
COPY . /var/www/html/
EXPOSE 80
COPY main.sh /
ENTRYPOINT ["/main.sh"]