class Meal < ActiveRecord::Base
    belongs_to :taco
    belongs_to :user

    def self.create_new_meal(taco_id, user_id)
        returned_meal = Meal.find_by(taco_id: taco_id, user_id: user_id)
        if returned_meal.nil?
            Meal.create(taco_id: taco_id, user_id: user_id)
            puts "-~~~AWESOME-SAUCE~~~"
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
        id = User.get_user_id(name)
        meals = Meal.where(user_id: id)
        meals.each do |meal|
            puts meal.taco.name
        end
    end

end