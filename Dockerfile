FROM ruby:2.5

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends apt-utils apt-transport-https

RUN apt-get install -y netselect-apt && netselect-apt -c Japan
RUN cat sources.list
RUN mv sources.list /etc/apt/sources.list
RUN apt-get update

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

ENV NPM_PATH=/npm-global \
    NPM_BIN=/npm-global/bin
ENV PATH="${NPM_BIN}:${PATH}"

# address redis complaints
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf

# prep our user
RUN mkdir /home/user
RUN mkdir /home/user/.ssh
RUN useradd user

RUN mkdir $BUNDLE_PATH
RUN mkdir $NPM_PATH

RUN mkdir /auth

RUN chown user: $BUNDLE_PATH -R
RUN chown user: $NPM_PATH -R
RUN chown user: /auth -R
RUN chown user: /myapp -R
RUN chown user: /home/user -R

USER user
