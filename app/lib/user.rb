class User < ActiveRecord::Base
   
    # Returns array of user names 
    def self.get_user_names
        all.pluck(:name)
    end

    def self.get_user_input
        gets.chomp
    end

    # Asks user for name, receives a name, and prints out a welcom message with name
    def self.create_user_name
        puts "What is your name friend?"
        name = get_user_input
        User.create(name: name)
        puts "Welcome to TacoLandia #{name}"
        ###Avocado Dancing####
    end

    def self.welcome_back
        puts "Welcome back"
    end

end