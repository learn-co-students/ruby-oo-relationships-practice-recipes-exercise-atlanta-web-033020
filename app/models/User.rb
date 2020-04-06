class User
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        recipe_cards = RecipeCard.all.select { |rc| rc.user == self }
        recipe_cards.map { |rc| rc.recipe }
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        algs = Allergy.all.select { |allergy| allergy.user == self }
        algs.map { |al| al.ingredient }
    end
end