class Meal < ActiveRecord::Base
    belongs_to :taco
    belongs_to :user

    def self.create_new_meal(taco_id, user_id)
        Meal.create(taco_id: taco_id, user_id: user_id)
    end

    def self.get_user_meals(name)
        id = User.get_user_id(name)
        meals = Meal.where(user_id: id)
        meals.each do |meal|
            puts meal.taco.name
        end
    end

end