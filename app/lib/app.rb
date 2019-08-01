
def banner
    box = TTY::Box.frame(width: 80, height: 12, border: :thick, align: :center) do
        "
   ______   ____    __   ___   _       ____  ____   ___    ____   ____ 
  |      | /    |  /  ] /   \\ | |     /    ||    \\ |   \\  |    | /    |
  |      ||  o  | /  / |     || |    |  o  ||  _  ||    \\  |  | |  o  |
  |_|  |_||     |/  /  |  O  || |___ |     ||  |  ||  D  | |  | |     |
    |  |  |  _  /   \\_ |     ||     ||  _  ||  |  ||     | |  | |  _  |
    |  |  |  |  \\     ||     ||     ||  |  ||  |  ||     | |  | |  |  |
    |__|  |__|__|\\____| \\___/ |_____||__|__||__|__||_____||____||__|__|
                                                                  
  "end
      print box
      puts "\n"
end


def welcome_user
    box = TTY::Box.frame(width: 80, height: 30, border: :thick, align: :center, padding: 1) do
      "
    __    __    ___  _        __   ___   ___ ___    ___         
   |  |__|  |  /  _]| |      /  ] /   \\ |   |   |  /  _]        
   |  |  |  | /  [_ | |     /  / |     || _   _ | /  [_         
   |  |  |  ||    _]| |___ /  /  |  O  ||  \\_/  ||    _]        
   |  `  '  ||   [_ |     /   \\_ |     ||   |   ||   [_         
    \\      / |     ||     \\     ||     ||   |   ||     |        
     \\_/\\_/  |_____||_____|\\____| \\___/ |___|___||_____|        
                                                                
                        ______   ___                            
                       |      | /   \\                           
                       |      ||     |                          
                       |_|  |_||  O  |                          
                         |  |  |     |                          
                         |  |  |     |                          
                         |__|   \\___/                           
                                                                
 ______   ____    __   ___   _       ____  ____   ___    ____   ____ 
|      | /    |  /  ] /   \\ | |     /    ||    \\ |   \\  |    | /    |
|      ||  o  | /  / |     || |    |  o  ||  _  ||    \\  |  | |  o  |
|_|  |_||     |/  /  |  O  || |___ |     ||  |  ||  D  | |  | |     |
  |  |  |  _  /   \\_ |     ||     ||  _  ||  |  ||     | |  | |  _  |
  |  |  |  |  \\     ||     ||     ||  |  ||  |  ||     | |  | |  |  |
  |__|  |__|__|\\____| \\___/ |_____||__|__||__|__||_____||____||__|__|
                                                                
" end
    print box
    sleep(2)
    system "clear"
    banner
    puts "Tell us who you are!!!"
end

def goodbye 
    box = TTY::Box.frame(width: 80, height: 25, border: :thick, align: :center, padding: 3) do
    "
    ____   ___    ___   ___    ____   __ __    ___     
   /    | /   \\  /   \\ |   \\  |    \\ |  |  |  /  _]    
  |   __||     ||     ||    \\ |  o  )|  |  | /  [_     
  |  |  ||  O  ||  O  ||  D  ||     ||  ~  ||    _]    
  |  |_ ||     ||     ||     ||  O  ||___, ||   [_     
  |     ||     ||     ||     ||     ||     ||     |    
  |___,_| \\___/  \\___/ |_____||_____||____/ |_____|    
                                                       
   _____  ____   ____    ___  ____   ___    __  __  __ 
  |     ||    \\ |    |  /  _]|    \\ |   \\  |  ||  ||  |
  |   __||  D  ) |  |  /  [_ |  _  ||    \\ |  ||  ||  |
  |  |_  |    /  |  | |    _]|  |  ||  D  ||__||__||__|
  |   _] |    \\  |  | |   [_ |  |  ||     | __  __  __ 
  |  |   |  .  \\ |  | |     ||  |  ||     ||  ||  ||  |
  |__|   |__|\\_||____||_____||__|__||_____||__||__||__|
                                                       
  "    
  end
  print box                                              
end

def runner
    system "clear"
    banner
    #Welcomes user or creates new user
    prompt = TTY::Prompt.new
    welcome_user
    sleep(1.5)
    system "clear"
    banner
    user_names = User.get_user_names
    name_menu_options = User.get_user_names
    name_menu_options << "Create new user"
    name_menu_options << "Update username"
    name_menu_options << "Exit program"
    user_name_selection = prompt.select("What is your name friend?", name_menu_options)
    
    # binding.pry

    if user_names.include?(user_name_selection) && user_name_selection != "Exit program" && user_name_selection != "Create new user" && user_name_selection != "Update username"
        system "clear"
        banner
        puts "Welcome back #{user_name_selection}!"
        sleep(1.5)
        system "clear"
        banner
    elsif user_name_selection == "Create new user"
        system "clear"
        banner
        new_user = User.create_user_name 
        user_name_selection = new_user
        sleep(1.5)
        system "clear"
        banner
    elsif user_name_selection == "Update username"
        system "clear"
        banner
        user_name_selection = prompt.select("What is your name friend?", user_names)
        new_name = User.update_user_name(user_name_selection)
        system "clear"
        banner
        puts "Your username has been updated to #{new_name}!!!"
        sleep(1.5)
        system "clear"
        banner
    elsif user_name_selection == "Exit program"
        system "clear"
        goodbye
        abort 
    end
    

    #display main menu
    
    menu_options = ["Show me some tacos", "Choose a random taco for me", "Pair taco to drink", "Taco compatibility quiz", "See your favorite tacos", "Exit Program"]
    menu_selection = prompt.select("Please choose an option:", menu_options)
    system "clear"
    banner

    loop do
        case menu_selection
        when "Show me some tacos"
            system "clear"
            banner
            protein_selection = prompt.select("Please select a protein", ["Chicken", "Beef", "Pork", "Veggies", "Seafood"])
            returned_tacos = Taco.get_tacos_by_protein(protein_selection.downcase)
            taco_names_by_protein = []
            returned_tacos.each do |taco|
                # puts taco.name
                taco_names_by_protein << taco.name
            end
            system "clear"
            banner
            taco_names_by_protein << "Main Menu"
            taco_selection_by_protein = prompt.select("View taco details", taco_names_by_protein)
            system "clear"
            banner

            if taco_selection_by_protein == "Main Menu"
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
                banner
            else
                Taco.get_taco_details(taco_selection_by_protein)
                save_taco_response = prompt.select("Save taco to favorites?", ["Yes", "No"])
                if save_taco_response == "Yes"
                    taco_id = Taco.get_taco_id(taco_selection_by_protein)
                    user_id = User.get_user_id(user_name_selection)
                    Meal.create_new_meal(taco_id, user_id)
                    #either creates new meal or returns message
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    system "clear"
                    banner

                else
                    puts "Okay!"
                    sleep(1)
                    system "clear"
                    banner
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                end

            end
        
        when "Choose a random taco for me"
            system "clear"
            banner
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
                    #either creates new meal or returns message
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    system "clear"
                    banner
                
                else
                    puts "Okay!"
                    sleep(1)
                    system "clear"
                    banner
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                end

            elsif response == "Save taco"
                taco_id = Taco.get_taco_id(random_taco_return)
                user_id = User.get_user_id(user_name_selection)
                Meal.create_new_meal(taco_id, user_id)
                #either creates new meal or returns message
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
                banner
            
            elsif response == "Return to main menu"
                system "clear"
                banner
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
                banner
            end
        
        when "Pair taco to drink"
            system "clear"
            banner
            drink_names = Drink.get_drink_names
            drink_names << "Main Menu"
            drink_selection = prompt.select("Please choose an option:", drink_names)
            
            loop do
                case drink_selection
                when "Beer"
                    system "clear"
                    banner
                    puts "Tacos That Pair Nicely With Beer:"
                    puts "\n"
                    Drink.get_tacos_for_beer
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)
                    
                when "Classic Margarita"
                    system "clear"
                    banner
                    puts "Tacos That Pair Nicely With A Margarita:"
                    puts "\n"
                    Drink.get_tacos_for_margarita
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)

                when "Sangria"
                    system "clear"
                    banner
                    puts "Tacos That Pair Nicely With Sangria:"
                    puts "\n"
                    Drink.get_tacos_for_sangria
                    sleep(1)
                    puts "\n"
                    drink_selection = prompt.select("Please choose an option:", drink_names)

                else 
                    system "clear"
                    banner
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    break
                end
            end

        when "Taco compatibility quiz"
            taco_quiz_result = Taco.quiz
            # binding.pry
            sleep(1)
            puts "\n"
            save_taco_response = prompt.select("Save taco to favorites?", ["Yes", "No"])
                if save_taco_response == "Yes"
                    taco_id = taco_quiz_result.id
                    user_id = User.get_user_id(user_name_selection)
                    Meal.create_new_meal(taco_id, user_id)
                    #either creates new meal or returns message
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                    system "clear"
                    banner
                
                else
                    puts "Okay!"
                    sleep(1)
                    system "clear"
                    banner
                    menu_selection = prompt.select("Please choose an option:", menu_options)
                end


        when "See your favorite tacos"
            sleep(0.25)
            system "clear"
            banner
            Meal.get_user_meals(user_name_selection)
            sleep(0.5)
            puts "\n"
            delete_option = prompt.select("These are your favorite tacos!", ["Good to go", "Remove a Taco"])
            if delete_option == "Remove a Taco"
                system "clear"
                banner
                Meal.destroy_user_meal(user_name_selection)
            
            else
                system "clear"
                banner
                menu_selection = prompt.select("Please choose an option:", menu_options)
                system "clear"
                banner
                sleep(0.25)
            end


        when "Exit Program"
            system "clear"
            goodbye
            abort 
        else
            system "clear"
            goodbye
            abort 
        end
    end
    
end