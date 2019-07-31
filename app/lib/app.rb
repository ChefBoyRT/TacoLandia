def welcome_user
    puts "Welcome to TacoLandia!!!"
    puts "Tell us who you are"
end

def runner
    #Welcomes user or creates new user
    prompt = TTY::Prompt.new
    welcome_user
    user_names = User.get_user_names
    user_names << "Create new user"
    user_name_selection = prompt.select("What is your name friend?", user_names)
    # binding.pry
    if user_name_selection != "Create new user"
        puts "Welcome back #{user_name_selection}!"
    else
        new_user = User.create_user_name 
    end

    #display main menu
    menu_options = ["Show me a list of tacos", "Choose a random taco for me", "Pair taco to drink"]
    menu_selection = prompt.select("Please choose an option:", menu_options)
    if menu_selection == "Show me a list of tacos"
        taco_names = Taco.get_taco_names
        taco_names.each do |taco|
            puts taco 
        end
    
    elsif menu_selection == "Choose a random taco for me"
        print Taco.get_taco_names.sample + " Taco"
    
    elsif menu_selection == "Pair taco to drink"
        drink_names = Drink.get_drink_names
        drink_selection = prompt.select("Please choose an option:", drink_names)
        
        if drink_selection == "Beer"
            Drink.get_tacos_for_beer
        elsif drink_selection == "Classic Margarita"
            Drink.get_tacos_for_margarita
        elsif drink_selection == "Sangria"
            Drink.get_tacos_for_sangria
        end

    end


    
end