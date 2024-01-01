FROM ruby:latest
# ARG RUBYGEMS_VERSION=3.3.20

RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

WORKDIR /redis_app

COPY Gemfile Gemfile.lock /redis_app/

RUN bundle install

COPY . /redis_app/

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
