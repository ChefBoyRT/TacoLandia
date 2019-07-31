def welcome_user
    puts "Welcome to TacoLandia!!!"
    sleep(1.5)
    system "clear"
    puts "Tell us who you are!!!"
end

def runner
    system "clear"
    #Welcomes user or creates new user
    prompt = TTY::Prompt.new
    welcome_user
    sleep(1.5)
    system "clear"
    user_names = User.get_user_names
    user_names << "Create new user"
    user_names << "Exit program"
    user_name_selection = prompt.select("What is your name friend?", user_names)
    
    # binding.pry
    if user_names.include?(user_name_selection) && user_name_selection != "Exit program" && user_name_selection != "Create new user"
        puts "Welcome back #{user_name_selection}!"
    elsif user_name_selection == "Create new user"
        new_user = User.create_user_name 
        user_name_selection = new_user
        sleep(1.5)
        system "clear"
    elsif user_name_selection == "Exit program"
        abort "Goodbye!"
    end
    

    #display main menu
    
    menu_options = ["Show me some tacos", "Choose a random taco for me", "Pair taco to drink", "See your favorite tacos", "Exit Program"]
    menu_selection = prompt.select("Please choose an option:", menu_options)
    system "clear"
    loop do
        case menu_selection
        when "Show me some tacos"
            protein_selection = prompt.select("Please select a protein", ["Chicken", "Beef", "Pork", "Veggie", "Seafood"])
            returned_tacos = Taco.get_tacos_by_protein(protein_selection.downcase)
            taco_names_by_protein = []
            returned_tacos.each do |taco|
                # puts taco.name
                taco_names_by_protein << taco.name
            end
            system "clear"
            taco_names_by_protein << "Main Menu"
            taco_selection_by_protein = prompt.select("View taco details", taco_names_by_protein)
            system "clear"
            if taco_selection_by_protein == "Main Menu"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
            else
                Taco.get_taco_details(taco_selection_by_protein)
            end
            binding.pry



            taco_names = Taco.get_taco_names
            taco_names.each do |taco|
                puts taco 
                sleep(0.25)
            end
            sleep(1)
            system "clear"
            menu_selection = prompt.select("Please choose an option:", menu_options)
        
        when "Choose a random taco for me"
            random_taco_return = Taco.get_taco_names.sample
            puts random_taco_return + " Taco"
            response = prompt.select("Please choose an option:", ["See taco details", "Save taco", "Return to main menu"])
            if response == "See taco details"
                Taco.get_taco_details(random_taco_return)
                sleep(5)
                system "clear"
                menu_selection = prompt.select("Please choose an option:", menu_options)
            elsif response == "Save taco"
                taco_id = Taco.get_taco_id(random_taco_return)
                user_id = User.get_user_id(user_name_selection)
                Meal.create_new_meal(taco_id, user_id)
                puts "AWESOME"
                sleep(1)
                puts "Your #{random_taco_return} Taco has been saved!!!"
                sleep(1.25)
                system "clear"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
            elsif response == "Return to main menu"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
            end
        
        when "Pair taco to drink"
            drink_names = Drink.get_drink_names
            drink_names << "Main Menu"
            drink_selection = prompt.select("Please choose an option:", drink_names)
            
            case drink_selection
            when "Beer"
                Drink.get_tacos_for_beer
                sleep(4)
                system "clear"
                
            when "Classic Margarita"
                Drink.get_tacos_for_margarita
                

            when "Sangria"
                Drink.get_tacos_for_sangria
                sleep(5)
                system "clear"

            else 
                menu_selection = prompt.select("Please choose an option:", menu_options)
            end

        when "See your favorite tacos"
            Meal.get_user_meals(user_name_selection)
            sleep(4)
            system "clear"
            menu_selection = prompt.select("Please choose an option:", menu_options)
            system "clear"

        when "Exit Program"
            abort "Goodbye!"
        else
            abort "Goodbye!"
        end
    end
    
end