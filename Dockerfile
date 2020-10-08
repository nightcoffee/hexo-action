FROM node:12-buster-slim

LABEL version="1.0.3"
LABEL repository="https://github.com/nightcoffee/hexo-action"
LABEL homepage="https://nightcoffee.github.io"
LABEL maintainer="nightcoffee <nightcoffee@ydkf.me>"

COPY entrypoint.sh /entrypoint.sh
COPY sync_deploy_history.js /sync_deploy_history.js

RUN apt-get update > /dev/null && \
    apt-get install -y git openssh-client rsync > /dev/null ; \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
