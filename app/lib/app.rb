def welcome_user
    puts "Welcome to TacoLandia!!!"
    puts "Tell us who you are"
end

def runner
    #Welcomes user or creates new user
    prompt = TTY::Prompt.new
    welcome_user
    names = User.get_user_names
    names << "Create new user"
    name_selection = prompt.select("What is your name friend?", names)
    # binding.pry
    if name_selection != "Create new user"
        puts "Welcome back #{name_selection}!"
    else
        new_user = User.create_user_name 
    end

    #display main menu
    menu_options = ["Show me a list of tacos", "Choose a random taco for me"]
    menu_selection = prompt.select("Please choose an option:", menu_options)
    if menu_selection == "Show me a list of tacos"
        taco_names = Taco.get_taco_names
        taco_names.each do |taco|
            puts taco 
        end
    elsif menu_selection == "Choose a random taco for me"
        print Taco.get_taco_names.sample + " Taco"
    end
    
    
end