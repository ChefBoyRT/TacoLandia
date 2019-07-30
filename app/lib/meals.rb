class Meal < ActiveRecord::Base
    belongs_to :taco
    belongs_to :user
end