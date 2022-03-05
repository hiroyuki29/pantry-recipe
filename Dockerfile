FROM ruby:2.5
RUN apt-get update && apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        postgresql-client \
        yarn
WORKDIR /pantry-recipe
COPY Gemfile Gemfile.lock /pantry-recipe/
RUN bundle install
