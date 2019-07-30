require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'tty-prompt'

require_all 'app'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/tacos.db'
)

ActiveRecord::Base.logger = nil

runner

binding.pry