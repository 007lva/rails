FROM ruby:2.2

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash

RUN apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

RUN npm install phantomjs -g --phantomjs_cdnurl=http://cnpmjs.org/downloads

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.3

RUN gem install rails --version "$RAILS_VERSION"

RUN gem install byebug
RUN gem install database_cleaner
RUN gem install sqlite3
RUN gem install codeclimate-test-reporter
RUN gem install capybara
RUN gem install poltergeist
RUN gem install fuubar
RUN gem install rspec-rails
RUN gem install shoulda-matchers
RUN gem install guard-rspec
RUN gem install factory_girl_rails

# pronto integration
RUN apt-get install cmake
RUN gem install pronto
RUN gem install pronto-rubocop
RUN gem install pronto-scss

