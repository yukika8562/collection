FROM ruby:2.5.3
RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	node.js \
	mysql-client \
	yarn
WORKDIR /workdir
COPY Gemfile Gemfile.lock /workdir/
RUN bundle install