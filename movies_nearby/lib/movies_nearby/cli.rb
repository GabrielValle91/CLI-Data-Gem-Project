class MoviesNearBy::CLI

  def call
    self.create_movies
    self.list_movies
    self.inquire
    self.goodbye
  end

  def create_movies
    puts "Welcome! This program will help you find movies in a specified zip code"
    puts "\nPlease enter a zip code"
    zip_code = gets
    overview_url = "https://www.imdb.com/showtimes/location/US/#{zip_code}".chomp
    movies = MovieScraper.scrape_movie_overview(overview_url, zip_code)
    MoviesNearBy::Movies.create_from_list(movies)
    movie_details = {}
    MoviesNearBy::Movies.all.each do |movie|
      movie_details = MovieScraper.scrape_movie_details(movie.url)
      movie.add_movie_details(movie_details)
    end
  end

  def list_movies
    puts "Movies in a theater near you:"
    @movies = MoviesNearBy::Movies.all
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
    end
  end

  def inquire
    input = nil
    while input != "exit"
      puts "Enter the number of the movie you would like more info on or type 'list' to return to the list or 'exit':"
      input = gets.strip.downcase
      if input == "list"
        self.list_movies
      elsif input.to_i > 0
        if movie = MoviesNearBy::Movies.find(input.to_i)
          self.print_movie_details(movie)
        else
          puts "There is no movie on the list with that number, try again please."
        end
      elsif input == "exit"
      else
        puts "That is not a valid option, please try again."
      end
    end
  end

  def print_movie_details(movie)
    puts "\nMovie Name: #{movie.name}"
    puts "Rating: #{movie.rating}"
    puts "Length: #{movie.length}"
    puts "Genre(s): #{movie.genre}"
    puts "Score: #{movie.review_score}"
    puts "Summary: #{movie.bio}"
    puts ""
  end

  def goodbye
    puts "\nHopefully you found a movie to enjoy!\nGoodbye!"
  end

end
