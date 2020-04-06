class Ingredient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        self.all.max { |ingredient1, ingredient2| Ingredient.num_users(ingredient1) <=> Ingredient.num_users(ingredient2) }
    end

    def self.num_users(ingredient)
        Allergy.all.select { |allergy| allergy.ingredient == ingredient }.length
    end
end