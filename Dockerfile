FROM ruby:2.5.0

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  postgresql-client \
  build-essential \
  libpq-dev \
  libqt5webkit5-dev \
  && apt-get clean \
  && rm -rf /var/lib/pat/lists

ENV APP_HOME /site-builder
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler -v 1.17.3
RUN bundle install

ADD . $APP_HOME
