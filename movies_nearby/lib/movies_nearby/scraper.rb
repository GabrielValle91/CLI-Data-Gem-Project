class MovieScraper
  def self.scrape_movie_overview(overview_url, zip_code)
    html = open(overview_url)
    doc = Nokogiri::HTML(html)
    movie_array = []
    binding.pry
    movie_list = doc.css(".lister-item")
    #after finding the correct attribute for the list of movies, need to iterate through them to grab the correct details (name and url)
    #these details will be storage in a hash and then pushed onto the movie_array
    movie_list.each do |movie|
      movie_hash = {}
      movie_hash[:name] = movie.css(".title")

      movie_array << movie_hash
    end

    movie_array
  end
end
