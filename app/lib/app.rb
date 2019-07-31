def welcome_user
    puts "Welcome to TacoLandia!!!"
    puts "Tell us who you are"
end

def runner
    exit_program = false
    #Welcomes user or creates new user
    prompt = TTY::Prompt.new
    welcome_user
    user_names = User.get_user_names
    user_names << "Create new user"
    user_names << "Exit program"
    user_name_selection = prompt.select("What is your name friend?", user_names)
    # binding.pry
    if user_names.include?(user_name_selection) && user_name_selection != "Exit program"
        puts "Welcome back #{user_name_selection}!"
    elsif user_name_selection == "Create new user"
        new_user = User.create_user_name 
    elsif user_name_selection == "Exit program"
        abort "Goodbye!"
    end

    #display main menu
    
    menu_options = ["Show me a list of tacos", "Choose a random taco for me", "Pair taco to drink", "See your favorite tacos", "Exit Program"]
    menu_selection = prompt.select("Please choose an option:", menu_options)
    
    loop do
        case menu_selection
        when "Show me a list of tacos"
            taco_names = Taco.get_taco_names
            taco_names.each do |taco|
                puts taco 
            end
        
        when "Choose a random taco for me"
            random_taco_return = Taco.get_taco_names.sample
            puts random_taco_return + " Taco"
            response = prompt.select("Please choose an option:", ["See taco details", "Save taco", "Return to main menu"])
            if response == "See taco details"
                Taco.get_taco_details(random_taco_return)
            elsif response == "Save taco"
                taco_id = Taco.get_taco_id(random_taco_return)
                user_id = User.get_user_id(user_name_selection)
                Meal.create_new_meal(taco_id, user_id)
                puts "AWESOME"
                sleep(1)
                puts "Your #{random_taco_return} Taco has been saved!!!"
                sleep(1)
                system "clear"
                menu_selection = prompt.select("Please choose an option:", menu_options)
            elsif response == "Return to main menu"
                menu_selection = prompt.select("Please choose an option:", menu_options)
            end
        
        when "Pair taco to drink"
            drink_names = Drink.get_drink_names
            drink_names << "Main Menu"
            drink_selection = prompt.select("Please choose an option:", drink_names)
            
            if drink_selection == "Beer"
                Drink.get_tacos_for_beer
            elsif drink_selection == "Classic Margarita"
                Drink.get_tacos_for_margarita
            elsif drink_selection == "Sangria"
                Drink.get_tacos_for_sangria
            else 
                menu_selection = prompt.select("Please choose an option:", menu_options)
            end
        when "Exit Program"
            abort "Goodbye!"
        else
            exit_program = true
        end
    end
    
end