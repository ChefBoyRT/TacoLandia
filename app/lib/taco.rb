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

    def self.quiz
        prompt = TTY::Prompt.new
        system "clear"
        protein = prompt.select("What kind of protein would you like?", %w[Chicken Beef Pork Veggies Seafood])
        system "clear"
        heat_level = prompt.select("How hot can you handle?", %w[1 2 3])
        system "clear"
        shell_type = prompt.select("Crunchy or nah?", %w[Crunchy Soft])
        system "clear"
        drink = prompt.select("Would you like a drink with that?", %w[Yes..(21+) No])
        system "clear"
        return_tacos = Taco.where(protein: protein.downcase, heat_level: heat_level.to_i, shell_type: shell_type.downcase)
        random_taco = return_tacos.sample
        if drink == "Yes..(21+)"
            puts "Your best match is a #{random_taco.name} with a #{random_taco.drink.name}!" 
        else
            puts "Your best match is a #{random_taco.name}!"
        end
        
    end
end