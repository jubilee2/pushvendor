FROM ruby:2.7.4-alpine

# Edit with nodejs, mysql-client, postgresql-client, sqlite3, etc. for your needs.
# Or delete entirely if not needed.
RUN apk --no-cache add nodejs postgresql-client tzdata libc6-compat

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/
# Install build dependencies - required for gems with native dependencies
RUN apk add --no-cache --virtual build-deps build-base postgresql-dev && \
  gem install bundler:2.4.2 && \
  bundle install --without development test doc && \
  apk del build-deps

COPY . .

ENV RAILS_RELATIVE_URL_ROOT=/pushvendor
ENV RAILS_ENV="production" 
ENV RAILS_SERVE_STATIC_FILES=true
ENV NODE_ENV="production" 

RUN SECRET_KEY_BASE=`rails secret` DATABASE_URL=postgresql:dummy rails assets:precompile && \
  cp -r ./public${RAILS_RELATIVE_URL_ROOT}/assets ./public

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
