# how to run?
bundle exec rackup

# how to migrate?
bundle exec sequel -m ./db/migrations sqlite://db/development.db --echo