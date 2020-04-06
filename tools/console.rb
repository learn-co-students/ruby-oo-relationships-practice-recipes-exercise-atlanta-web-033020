require_relative '../config/environment.rb'

chicken_soup = Recipe.new("Chicken Soup")
grilled_steak = Recipe.new("Grilled Steak")
tomato_soup = Recipe.new("Tomato Soup")

onion = Ingredient.new("Onion")
carrot = Ingredient.new("Carrot")
chicken = Ingredient.new("Chicken")
steak = Ingredient.new("Steak")
tomato = Ingredient.new("Tomato")
chicken_broth = Ingredient.new("Chicken Broth")
potato = Ingredient.new("Potato")
broccoli = Ingredient.new("Broccoli")

brandon = User.new("Brandon")
wendy = User.new("Wendy")
robert = User.new("Robert")

recipe_card1 = RecipeCard.new(brandon, chicken_soup)
recipe_card2 = RecipeCard.new(wendy, grilled_steak)
recipe_card3 = RecipeCard.new(wendy, chicken_soup)
recipe_card4 = RecipeCard.new(robert, tomato_soup)

recipe_ingredient1 = RecipeIngredient.new(onion, chicken_soup)
recipe_ingredient2 = RecipeIngredient.new(carrot, chicken_soup)
recipe_ingredient3 = RecipeIngredient.new(chicken, chicken_soup)
recipe_ingredient4 = RecipeIngredient.new(chicken_broth, chicken_soup)
recipe_ingredient5 = RecipeIngredient.new(steak, grilled_steak)
recipe_ingredient6 = RecipeIngredient.new(onion, grilled_steak)
recipe_ingredient7 = RecipeIngredient.new(tomato, tomato_soup)

allergy1 = Allergy.new(wendy, steak)
allergy2 = Allergy.new(brandon, tomato)
allergy3 = Allergy.new(robert, onion)

binding.pry
