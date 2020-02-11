require 'bundler'
Bundler.require

set :database, {
  adapter: "sqlite3",
  database: "db/development.sqlite3"
}

require './app/controllers/application_controller'
require_all 'app'
