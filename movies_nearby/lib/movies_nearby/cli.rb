class MoviesNearBy::CLI

  def call
    #greet the user and ask for a zip
    #create movies found based on zip
    self.create_movies
    #list Movies
    #ask which movie to provide more detail on
    #say goodbye to user upon exit
  end

  def create_movies
    puts "Welcome! This program will help you find movies in a spcefied zip code"
    puts "\nPlease enter a zip code"
    zip_code = gets
    overview_url = "https://www.imdb.com/showtimes/location/US/#{zip_code}".chomp
    movies = MovieScraper.scrape_movie_overview(overview_url, zip_code) #need to create a method to scrape a list of movies and urls from imdb
    MoviesNearBy::Movies.create_from_list(movies) #need to create a method to create multiple instances of Movie class from an array
    #since the movie details are stored on a separate page, a different scraper method is needed
    #the details will be stored as a hash and then added to the corresponding Movie instance
    movie_details = {}
    MoviesNearBy::Movies.all.each do |movie|
      #running into error here, lets pry
      #binding.pry
      #discovered url is not being stored correctly, lets look at Scraper class
      movie_details = MovieScraper.scrape_movie_details(movie.url)
      #url was initially not including https://www.imdb.com
      movie.add_movie_details(movie_details)
      #getting an error here with only some zip codes, need to look into it

    end

    def list_movies
      puts "Movies in a theater near you:"
      @movies = MoviesNearBy::Movies.all
      @movies.each.with_index(1) do |movie, i|
        puts "#{i}. #{movie.name}"
      end
    end
  end

end
