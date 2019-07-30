Taco.destroy_all
Drink.destroy_all
User.destroy_all


#Users
Taylor = User.create(name: "Taylor", password: "password")
Cat = User.create(name: "Cat", password: "password")

#Drinks
beer = Drink.create(name: "Beer")
margarita = Drink.create(name: "Classic Margarita")
sangria = Drink.create(name: "Sangria")


##Tacos##
#Chicken Tacos
asian_marinated_chicken = Taco.create(name: "Asian Marinated Chicken", protein: "chicken", heat_level: 3, shell_type: "soft", drink: beer)
cilantro_lime_chicken = Taco.create(name: "Cilantro Lime Chicken", protein: "chicken", heat_level: 1, shell_type: "soft", drink: sangria)
honey_chipotle_chicken = Taco.create(name: "Honey Chipotle Chicken", protein: "chicken", heat_level: 2, shell_type: "soft", drink: beer)
grilled_chicken_and_avocado = Taco.create(name: "Grilled Chicken and Avocado", protein: "chicken", heat_level: 1, shell_type: "crunchy", drink: margarita)
chili_lime_chicken = Taco.create(name: "Chili Lime Chicken", protein: "chicken", heat_level: 3, shell_type: "crunchy", drink: margarita)
korean_fried_chicken = Taco.create(name: "Korean Fried Chicken", protein: "chicken", heat_level: 2, shell_type: "crunchy", drink: sangria)

#Beef Tacos
ground_beef = Taco.create(name: "Ground Beef", protein: "beef", heat_level: 1, shell_type: "soft", drink: sangria)
spicy_shredded_beef = Taco.create(name: "Spicy Shredded Beef", protein: "beef", heat_level: 3, shell_type: "crunchy", drink: beer)
carne_asada = Taco.create(name: "Carne Asada", protein: "beef", heat_level: 2, shell_type: "crunchy", drink: margarita)
beef_fajita = Taco.create(name: "Beef Fajita", protein: "beef", heat_level: 1, shell_type: "crunchy", drink: margarita)
ropa_vieja = Taco.create(name: "Ropa Vieja", protein: "beef", heat_level: 2, shell_type: "soft", drink: sangria)
barbacoa_beef = Taco.create(name: "Barbacoa Beef", protein: "beef", heat_level: 3, shell_type: "soft", drink: sangria)

#Pork Tacos
baja_pork = Taco.create(name: "Baja Pork", protein: "pork", heat_level: 1, shell_type: "crunchy", drink: beer)
cilantro_lime_pork = Taco.create(name:"Cilantro Lime Pork", protein: "pork", heat_level: 2, shell_type: "soft", drink: beer)
caramelized_pork = Taco.create(name: "Caramelized Pork", protein: "pork", heat_level: 3, shell_type: "soft", drink: margarita)
pulled_pork = Taco.create(name: "Pulled Pork", protein: "pork", heat_level: 2, shell_type: "crunchy", drink: margarita)
chipotle_pork = Taco.create(name: "Chipotle Pork", protein: "pork", heat_level: 3, shell_type: "crunchy", drink: sangria)
beer_braised_pork = Taco.create(name: "Beer-Braised Pork", protein: "pork", heat_level: 1, shell_type: "soft", drink: sangria)

#Veggie Tacos
roasted_veggie = Taco.create(name: "Roasted Veggie", protein: "veggies", heat_level: 3, shell_type: "soft", drink: margarita)
grilled_butternut_squash = Taco.create(name: "Grilled Butternut Squash", protein: "veggies", heat_level: 1, shell_type: "soft", drink: sangria)
sriracha_lentil = Taco.create(name: "Sriracha Lentil", protein: "veggies", heat_level: 2, shell_type: "soft", drink: sangria)
chipotle_quinoa = Taco.create(name: "Chipotle Quinoa", protein: "veggies", heat_level: 2, shell_type: "crunchy", drink: beer)
grilled_tempeh = Taco.create(name: "Grilled Tempeh", protein: "veggies", heat_level: 3, shell_type: "crunchy", drink: beer)
tofu_and_black_bean = Taco.create(name: "Tofu and Black Bean", protein: "veggies", heat_level: 1, shell_type: "crunchy", drink: margarita)

#Seafood Tacos
baha_fish = Taco.create(name: "Baha Fish", protein: "seafood", heat_level: 1, shell_type: "crunchy", drink: beer)
veracruz_fish = Taco.create(name: "Veracruz Fish", protein: "seafood", heat_level: 2, shell_type: "crunchy", drink: margarita)
chipotle_salmon = Taco.create(name: "Chipotle Salmon", protein: "seafood", heat_level: 3, shell_type: "crunchy", drink: sangria)
grilled_shrimp = Taco.create(name: "Grilled Shrimp", protein: "seafood", heat_level: 2, shell_type: "soft", drink: margarita)
cilantro_lime_mahi_fish = Taco.create(name: "Cilantro Lime Mahi Fish", protein: "seafood", heat_level: 3, shell_type: "soft", drink: sangria)
fried_shrimp = Taco.create(name: "Fried Shrimp", protein: "seafood", heat_level: 1, shell_type: "soft", drink: beer)




##need to build many-to-many through users (tacos >- users -< drink?)  
##CRUD(tacos or users?)