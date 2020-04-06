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

    def top_three_recipes
        recipe_cards = RecipeCard.all.select { |rc| rc.user == self }
        best_rcs = []
        while best_rcs.length < 3 and recipe_cards.length > 0 do
            best_rc = recipe_cards.max { |rc1, rc2| rc1.rating <=> rc2.rating }
            best_rcs << best_rc
            recipe_cards.delete(best_rc)
        end
        best_rcs.map { |rc| rc.recipe }
    end

    def most_recipe_recipe
        rcs = RecipeCard.all.select { |rc| rc.user == self }
        dates = rcs.map { |rc| rc.date }
        max_year = dates.max { |date1, date2| date1.split("/")[2] <=> date2.split("/")[2] }
        year = dates.select { |date| date.split("/")[2] == max_year.split("/")[2]}
        max_month = year.max { |date1, date2| date1.split("/")[0] <=> date2.split("/")[0] }
        month = year.select { |date| date.split("/")[0] == max_year.split("/")[0]}
        max_day = month.max { |date1, date2| date1.split("/")[1] <=> date2.split("/")[1] }
        RecipeCard.all.select { |rc| rc.date == max_day }
    end

    def safe_recipes
        bad_recipe_ingredients = []
        self.allergens.each do |allergen|
            bad_recipe_ingredients = RecipeIngredient.all.select { |rc| rc.ingredient == allergen }
        end
        bad_recipes = bad_recipe_ingredients.map { |bri| bri.recipe }

        Recipe.all - bad_recipes
    end
end