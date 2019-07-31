class Taco < ActiveRecord::Base
    belongs_to :drink
    has_many :meals
    has_many :users, through: :meals

    def self.get_taco_names
        all.pluck(:name).sort
    end

    def self.get_taco_details(taco)
        returned_taco = Taco.find_by(name: taco)
        puts "Name: " + returned_taco.name + " Taco"
        puts "Protein: " + returned_taco.protein
        puts "Heat Level: " + returned_taco.heat_level.to_s
        puts "Shell Type: " + returned_taco.shell_type
    end

    def self.get_taco_id(taco)
        Taco.find_by(name: taco).id
    end

    def self.get_tacos_by_protein(protein)
        Taco.where(protein: protein)
    end

end