class User

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

#helper method: pulls all recipe cards for that user
  def recipe_card
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def recipes
    self.recipe_card.map do |rc|
      rc.recipe
    end.uniq
  end

  def add_recipe_card(recipe,date,rating)
    RecipeCard.new(date,rating,self,recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(self,ingredient)
  end

  def allergens
    Allergen.all.collect do |allergen|
      if allergen.user == self
        allergen.ingredient
      end
    end.compact
  end

  def top_three_recipes
    new_hash = Hash.new
    self.recipe_card.each do |rc|
      new_hash[rc.recipe] = rc.rating
    end
    new_hash.sort_by{|k,v| v}.to_h
    if new_hash.length < 3
      new_hash.keys
    else
      new_hash.keys[(new_hash.length-3)..new_hash.length]
    end
  end

  def most_recent_recipe
    self.recipe_card.last.recipe
  end

  def safe_recipes
    empty_array = []
    self.allergens.each do |allergen_ingredient|
      Recipe.all.each do |recipe|
         if !recipe.ingredients.include?(allergen_ingredient)
          empty_array << recipe
        end
      end
    end
    empty_array
  end

end
