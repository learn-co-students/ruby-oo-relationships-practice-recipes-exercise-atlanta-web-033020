class Recipe
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        self.all.max_by { |recipe| recipe.users.length }
    end

    def recipe_cards
        RecipeCard.all.select { |rc| rc.recipe == self }
    end

    def users
        RecipeCard.all.select { |rc| rc.recipe == self }
        .map { |rc| rc.user }
    end

    def ingredients
        RecipeIngredient.all.select { |ri| ri.recipe == self }
        .map { |ri| ri.ingredient }
    end

    def allergens
        # Allergy.all.map { |allergy| allergy.ingredient }
        # .& self.ingredients
        self.all.select do |ingredient|
            Allergy.all.map { |allergy| allergy.ingredient }
            .include?(ingredient)
        end
    end

    def add_ingredients(ingredients)
        ingredients.each { |ingredient| RecipeIngredient.new(ingredient, self) }
    end
end