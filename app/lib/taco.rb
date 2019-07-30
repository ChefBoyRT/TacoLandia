class Taco < ActiveRecord::Base
    belongs_to :drink
    has_many :meals
    has_many :users, through: :meals
end