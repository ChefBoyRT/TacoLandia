class Drink < ActiveRecord::Base
    has_many :tacos

    
    def self.get_drink_names
        all.pluck(:name).sort
    end

    def self.get_tacos_for_beer
        beer = Drink.find_by(name: "Beer")
        paired = beer.tacos.pluck(:name).sort
        paired.each do |taco|
            print taco + "\n"
        end
    end

    def self.get_tacos_for_margarita
        margarita = Drink.find_by(name: "Classic Margarita")
        paired = margarita.tacos.pluck(:name).sort
        paired.each do |taco|
            print taco + "\n"
        end
    end

    def self.get_tacos_for_sangria
        sangria = Drink.find_by(name: "Sangria")
        paired = sangria.tacos.pluck(:name).sort
        paired.each do |taco|
            print taco + "\n"
        end
    end

end