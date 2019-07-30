require 'sinatra/activerecord'
require 'require_all'
require 'pry'

require_all './app/lib'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/tacos.db'
)


# binding.pry