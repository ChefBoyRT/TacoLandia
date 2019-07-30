require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'
# require_relative '../app/lib/app.rb'
require_all 'app'



ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/tacos.db'
)

prompt = TTY::Prompt.new

runner

# binding.pry