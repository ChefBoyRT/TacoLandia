def welcome_user
    puts "  Welcome"
    puts "    to"
    puts "TacoLandia!!!"
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
        system "clear"
        puts "Welcome back #{user_name_selection}!"
        sleep(1.5)
        system "clear"
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
            system "clear"
            protein_selection = prompt.select("Please select a protein", ["Chicken", "Beef", "Pork", "Veggies", "Seafood"])
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
                save_taco_response = prompt.select("Save taco to favorites?", ["Yes", "No"])
                if save_taco_response == "Yes"
                    taco_id = Taco.get_taco_id(taco_selection_by_protein)
                    user_id = User.get_user_id(user_name_selection)
                    Meal.create_new_meal(taco_id, user_id)
                    puts "-~~~AWESOME-SAUCE~~~"
                    sleep(1.25)
                    puts "Your #{taco_selection_by_protein} Taco has been saved!!!"
                    sleep(1.25)
                    system "clear"
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    system "clear"

                else
                    puts "Okay!"
                    sleep(1)
                    system "clear"
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                end

            end
        
        when "Choose a random taco for me"
            system "clear"
            random_taco_return = Taco.get_taco_names.sample
            puts random_taco_return + " Taco"
            puts "\n"
            sleep(1)
            response = prompt.select("Please choose an option:", ["See taco details", "Save taco", "Return to main menu"])
            if response == "See taco details"
                Taco.get_taco_details(random_taco_return)
                puts "\n"
                save_taco_response = prompt.select("Save taco to favorites?", ["Yes", "No"])
                if save_taco_response == "Yes"
                    taco_id = Taco.get_taco_id(random_taco_return)
                    user_id = User.get_user_id(user_name_selection)
                    Meal.create_new_meal(taco_id, user_id)
                    puts "~~~AWESOME-SAUCE~~~"
                    sleep(1.25)
                    puts "Your #{random_taco_return} Taco has been saved!!!"
                    sleep(1.25)
                    system "clear"
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    system "clear"
                else
                    puts "Okay!"
                    sleep(1)
                    system "clear"
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    # system "clear"
                end
            elsif response == "Save taco"
                taco_id = Taco.get_taco_id(random_taco_return)
                user_id = User.get_user_id(user_name_selection)
                Meal.create_new_meal(taco_id, user_id)
                puts "~~~AWESOME-SAUCE~~~"
                sleep(1)
                puts "Your #{random_taco_return} Taco has been saved!!!"
                sleep(1.25)
                system "clear"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
            elsif response == "Return to main menu"
                system "clear"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
            end
        
        when "Pair taco to drink"
            system "clear"
            drink_names = Drink.get_drink_names
            drink_names << "Main Menu"
            drink_selection = prompt.select("Please choose an option:", drink_names)
            
            loop do
                case drink_selection
                when "Beer"
                    system "clear"
                    puts "Drinks That Pair Nicely With Beer:"
                    puts "\n"
                    Drink.get_tacos_for_beer
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)
                    # system "clear"
                    
                when "Classic Margarita"
                    system "clear"
                    puts "Drinks That Pair Nicely With A Margarita:"
                    puts "\n"
                    Drink.get_tacos_for_margarita
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)
                    # system "clear"

                when "Sangria"
                    system "clear"
                    puts "Drinks That Pair Nicely With Sangria:"
                    puts "\n"
                    Drink.get_tacos_for_sangria
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)
                    # system "clear"

                else 
                    system "clear"
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    break
                end
            end

        when "See your favorite tacos"
            system "clear"
            Meal.get_user_meals(user_name_selection)
            puts "\n"
            puts "\n"
            menu_selection = prompt.select("Please choose an option:", menu_options)
            system "clear"

        when "Exit Program"
            system "clear"
            abort "Goodbye!"
        else
            system "clear"
            abort "Goodbye!"
        end
    end
    
end