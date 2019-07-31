class User < ActiveRecord::Base
    has_many :meals
    has_many :tacos, through: :meals
    
    def initialize()
    end
    # Returns array of user names 
    def self.get_user_names
        all.pluck(:name)
    end

    def self.get_user_input
        gets.chomp
    end

    def self.get_user_id(user_name)
        User.find_by(name: user_name).id
    end

    # Asks user for name, receives a name, and prints out a welcom message with name
    def self.create_user_name
        name = self.get_user_input
        User.create(name: name)
        puts "Welcome to TacoLandia #{name}!"
        ###Avocado Dancing####
    end


end