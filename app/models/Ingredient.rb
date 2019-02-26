class Ingredient

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergy_count =  Hash.new
    Allergen.all.each do |allergy|
      if !allergy_count[allergy.ingredient]
        allergy_count[allergy.ingredient] = 1
      else
        allergy_count[allergy.ingredient] += 1
      end
    end
    most_common = 0
    most_common_ingredient = nil
    allergy_count.each do |k,v|
      if v > most_common
        most_common = v
        most_common_ingredient = k
      end
    end
    most_common_ingredient.name
  end


end
