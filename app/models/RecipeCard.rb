class RecipeCard
    attr_accessor :user, :recipe, :date, :rating
    @@all = []

    def initialize(user, recipe, date=Time.now.to_s, rating=0)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating
        @@all << self
    end

    def self.all
        @@all
    end
end