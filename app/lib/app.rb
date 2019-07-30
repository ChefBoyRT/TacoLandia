def welcome_user
    puts "Welcome to TacoLandia!!!"
    puts "Tell us who you are"
end

def runner
    prompt = TTY::Prompt.new
    welcome_user
    names = User.get_user_names
    names << "Create new user"
    selection = prompt.select("What is your name friend?", names)
    # binding.pry
    if selection != "Create new user"
        puts "Welcome back #{selection}!"
    else
        new_user = User.create_user_name 
    end
    
end