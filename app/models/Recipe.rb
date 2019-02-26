class Recipe

  @@all = []

  attr_reader :ingredients

  def initialize
    @ingredients = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(ingredients)
    @ingredients << ingredients
    @ingredients = @ingredients.flatten
  end

  def allergens
    allergen_array = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    final_list = self.ingredients & allergen_array
  end

#helper method: pulls all recipe cards for this recipe
  def recipe_cards
    RecipeCard.all.select do |rc|
      rc.recipe == self
    end
  end

  def users
    self.recipe_cards.map do |rc|
      rc.user
    end
  end

  def self.most_popular
    tally = Hash.new
    RecipeCard.all.each do |rc|
      if !tally[rc.recipe]
        tally[rc.recipe] = 1
      else
        tally[rc.recipe] += 1
      end
    end
    tally = tally.sort_by { |k,v| v }
    tally.last
  end

end
