class Meal < ActiveRecord::Base
    belongs_to :taco
    belongs_to :user

    def self.create_new_meal(taco_id, user_id)
        Meal.create(taco_id: taco_id, user_id: user_id)
    end

end