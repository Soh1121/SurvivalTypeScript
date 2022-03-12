FROM node:16

RUN apt upgrade && apt update \
  && apt install -y vim git zsh locales \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  # lang
  && cp -p /etc/localtime /etc/localtime.org \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && locale-gen ja_JP.UTF-8 && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
  && chsh -s /bin/zsh \
  && npm install -g typescript \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

COPY ./.devcontainer/.zshrc /root

ENV TZ       Asia/Tokyo
ENV LANGUAGE ja_JP:ja
ENV LC_ALL   ja_JP.utf8
ENV LANG     ja_JP.UTF-8

WORKDIR /home/Survival

# RUN usermod -d /home/Survival root
