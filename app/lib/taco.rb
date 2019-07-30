class Taco < ActiveRecord::Base
    belongs_to :drink
    has_many :meals
    has_many :users, through: :meals

    def self.get_taco_names
        all.pluck(:name).sort
    end

end