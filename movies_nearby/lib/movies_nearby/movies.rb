class MoviesNearBy::Movies
  @@all = []

  attr_accessor :name, :url, :rating, :length, :genre, :bio, :review_score

  def initialize(movie_hash)
    @name = movie_hash[:name]
    @url = movie_hash[:url]
    @@all << self
  end

  def self.create_from_list(movie_array)
    movie_array.each do |movie|
      MoviesNearBy::Movies.new(movie) #decided to feed hash into initialize instead of individual attributes
    end
  end

  def add_movie_details(movie_details)
    @rating = movie_details[:rating]
    @length = movie_details[:length]
    @genre = movie_details[:genre]
    @bio = movie_details[:bio]
    @review_score = movie_details[:review_score]
  end

  def self.find(number)
    @@all[number - 1]
  end

  def self.all
    @@all
  end
end
