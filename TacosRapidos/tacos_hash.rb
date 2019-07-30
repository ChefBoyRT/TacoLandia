require 'pry'
def tacos
tacos = [
    {
        name: "Asian Marinated Chicken",
        protein: "chicken",
        heat_level: 1,
        shell_type: "soft",
        drink_paring: "beer"
    },
    {
        name: "Cilantro Lime Chicken",
        protein: "chicken",
        heat_level: 1,
        shell_type: "crunchy",
        drink_paring: "sangria"
    },
    {
        name: "Honey Chipotle Chicken",
        protein: "chicken",
        heat_level: 2,
        shell_type: "soft",
        drink_paring: "beer"
    },
    {
        name: "Grilled Chicken and Avocado",
        protein: "chicken",
        heat_level: 1,
        shell_type: "crispy",
        drink_paring: "margarita"
    },
    {
        name: "Chili Lime Chicken",
        protein: "chicken",
        heat_level: 3,
        shell_type: "crispy",
        drink_paring: "margarita"
    },
    {
        name: "Korean Fried Chicken",
        protein: "chicken",
        heat_level: 1,
        shell_type: "crispy",
        drink_paring: "sangria"
    },
    {
        name: "Ground Beef",
        protein: "beef",
        heat_level: 1,
        shell_type: "soft",
        drink_paring: "beer"
    },
    {
        name: "Spicy Shredded Beef",
        protein: "beef",
        heat_level: 3,
        shell_type: "soft",
        drink_paring: "beer"
    },
    {
        name: "Carne Asada",
        protein: "beef",
        heat_level: 1,
        shell_type: "crispy",
        drink_paring: "margarita"
    },
    {
        name: "Beef Fajita",
        protein: "beef",
        heat_level: 1,
        shell_type: "crispy",
        drink_paring: "margarita"
    },
    {
        name: "Ropa Vieja",
        protein: "beef",
        heat_level: 2,
        shell_type: "soft",
        drink_paring: "sangria"
    },
    {
        name: "Barbacoa Beef",
        protein: "beef",
        heat_level: 3,
        shell_type: "soft",
        drink_paring: "sangria"
    }, 
    {
        name: "Baja Pork",
        protein: "pork",
        heat_level: 1,
        shell_type: "crispy",
        drink_paring: "beer"
    },
    {
        name: "Lime-Cilantro Pork",
        protein: "pork",
        heat_level: 2,
        shell_type: "soft",
        drink_paring: "beer"
    },
    {
        name: "Caramelized Pork",
        protein: "pork",
        heat_level: 3,
        shell_type: "soft",
        drink_paring: "margarita"
    },
    {
        name: "Pulled Pork",
        protein: "pork",
        heat_level: 2,
        shell_type: "crispy",
        drink_paring: "margarita"
    },
    {
        name: "Chipotle Pork",
        protein: "pork",
        heat_level: 3,
        shell_type: "crispy",
        drink_paring: "sangria"
    },
    {
        name: "Beer-Braised Pork",
        protein: "pork",
        heat_level: 1,
        shell_type: "soft",
        drink_paring: "sangria"
    },
    {
        name: "Roasted Veggie",
        protein: "veggies",
        heat_level: 3,
        shell_type: "soft",
        drink_paring: "margarita"
    },
    {
        name: "Roasted Butternut Squash",
        protein: "veggies",
        heat_level: 1,
        shell_type: "soft",
        drink_paring: "sangria"
    },
    {
        name: "Sriracha Lentil",
        protein: "veggies",
        heat_level: 2,
        shell_type: "soft",
        drink_paring: "sangria"
    },
    {
        name: "Chipotle Quinoa",
        protein: "veggies",
        heat_level: 2,
        shell_type: "crunchy",
        drink_paring: "beer"
    },
    {
        name: "Grilled Tempeh",
        protein: "veggies",
        heat_level: 3,
        shell_type: "crunchy",
        drink_paring: "beer"
    },
    {
        name: "Tofu and Black Bean",
        protein: "veggies",
        heat_level: 1,
        shell_type: "crunchy",
        drink_paring: "margarita"
    },
    {
        name: "Baha Fish",
        protein: "seafood",
        heat_level: 1,
        shell_type: "crunchy",
        drink_paring: "beer"
    },
    {
        name: "Veracruz Fish",
        protein: "seafood",
        heat_level: 2,
        shell_type: "crunchy",
        drink_paring: "margarita"
        },
    {
        name: "Chipotle Salmon",
        protein: "seafood",
        heat_level: 3,
        shell_type: "crunchy",
        drink_paring: "sangria"
    },
    {
        name: "Grilled Shrimp",
        protein: "seafood",
        heat_level: 2,
        shell_type: "soft",
        drink_paring: "margarita"
    },
    {
        name: "Lime-Cilantro Mahi Fish",
        protein: "seafood",
        heat_level: 3,
        shell_type: "soft",
        drink_paring: "sangria"
    },
    {
        name: "Fried Shrimp",
        protein: "seafood",
        heat_level: 1,
        shell_type: "soft",
        drink_paring: "beer"
    }
       
]
end


#puts names and returns array of taco names
def taco_names 
    tacos.map do |taco|
       p taco[:name]
    end
end


# binding.pry
