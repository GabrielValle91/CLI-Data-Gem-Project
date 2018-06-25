class MoviesNearBy::CLI

  def call
    #greet the user and ask for a zip
    #create movies found based on zip
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
      movie_details = MovieScraper.scrape_movie_details(movie.url)
      movie.add_moviedetails(movie_details)
    end
  end

end
