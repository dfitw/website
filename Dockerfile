FROM ruby:3.1.2-bullseye
RUN apt-get update -qq
WORKDIR /website 
COPY Gemfile /website/Gemfile
RUN bundle install

EXPOSE 4567
CMD ["ruby", "website.rb"]

