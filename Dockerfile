FROM python:3.8-alpine

COPY . /

RUN apk add --no-cache nmap nmap-scripts git \
    && pip install --no-cache-dir -r requirements.txt \
    && git clone https://github.com/vulnersCom/nmap-vulners /usr/share/nmap/scripts/vulners \
    && nmap --script-updatedb \
    && apk del git

ENTRYPOINT ["/bin/sh", "-c", "/run.sh"]
