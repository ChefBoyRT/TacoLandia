class Meal < ActiveRecord::Base
    belongs_to :taco
    belongs_to :user

    def self.create_new_meal(taco_id, user_id)
        returned_meal = Meal.find_by(taco_id: taco_id, user_id: user_id)
        if returned_meal.nil?
            Meal.create(taco_id: taco_id, user_id: user_id)
            puts "~~~AWESOME-SAUCE~~~"
            sleep(1.25)
            puts "Your taco has been saved!!!"
            sleep(1.25)
            system "clear"
        else
            system "clear"
            puts "You already LOVE this taco!!!"
            puts "...and this taco already loves you too..."
            sleep(2.5)
            system "clear"
        end
    end

    def self.get_user_meals(name)
        meal_tacos = []
        id = User.get_user_id(name)
        meals = Meal.where(user_id: id)
        meals.each do |meal|
            puts meal.taco.name
            meal_tacos << meal.taco.name
        end
        meal_tacos
    end

    def self.destroy_user_meal(user)
        prompt = TTY::Prompt.new
        user_meals = get_user_meals(user)
        user_id = User.find_by(name: user).id
        system "clear"
        user_taco_selection = prompt.select("Which taco would you like to remove from your favorites?", user_meals)
        # binding.pry
        taco_id = Taco.find_by(name: user_taco_selection).id
        Meal.find_by(taco_id: taco_id, user_id: user_id).destroy
    end

end