require_relative '../config/environment.rb'

bananas = Ingredient.new("Banana")
carrots = Ingredient.new("Carrot")
chicken = Ingredient.new("Chicken")
noodles = Ingredient.new("Noodles")

bob = User.new("Bob")
jeff = User.new("Jeff")
sarah = User.new("Sarah")
jenny = User.new("Jenny")

allergen1 = Allergen.new(bob, bananas)
allergen2 = Allergen.new(jeff, noodles)
allergen3 = Allergen.new(sarah, carrots)
allergen4 = Allergen.new(bob, carrots)

recipe1 = Recipe.new
recipe2 = Recipe.new
recipe3 = Recipe.new
recipe4 = Recipe.new

rc1 = RecipeCard.new(Time.now.to_s[0..9], 5, bob, recipe1)
rc2 = RecipeCard.new("2019-02-24", 4, bob, recipe2)
rc3 = RecipeCard.new("2019-02-22", 2, sarah, recipe3)
rc4 = RecipeCard.new("2019-01-18", 1, bob, recipe3)
rc5 = RecipeCard.new("2019-02-01", 3, bob, recipe4)

recipe1.add_ingredients([carrots,bananas,noodles,chicken])
recipe2.add_ingredients([bananas,noodles])
recipe3.add_ingredients([chicken])
recipe4.add_ingredients([carrots,noodles,chicken])

binding.pry
