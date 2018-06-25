class MovieScraper
  def self.scrape_movie_overview(overview_url, zip_code)
    html = open(overview_url)
    doc = Nokogiri::HTML(html)
    movie_array = []

    movie_list = doc.css(".lister-item")
    #after finding the correct attribute for the list of movies, need to iterate through them to grab the correct details (name and url)
    #these details will be storage in a hash and then pushed onto the movie_array
    movie_list.each do |movie|
      movie_hash = {}
      movie_hash[:name] = movie.css(".title").text
      movie_hash[:url] = ("https://www.imdb.com" + movie.css("a").attribute("href").value.gsub("?ref_=shlc_li_i","") + "US/" + zip_code).chomp
      #binding.pry

      movie_array << movie_hash
    end

    movie_array
  end

  def self.scrape_movie_details(movie_url)
    #need to store movie attributes in a hash to easily add them to their Movie object
    movie_hash = {}
    #must open up movie url to scrape details
    html = open(movie_url)
    doc = Nokogiri::HTML(html)
    #time to dig for details
    details = doc.css(".cert-runtime-genre")
    movie_hash[:rating] = details.css("img").attribute("title").value
    movie_hash[:length] = details.css("time").text
    movie_hash[:genre] = details.css("span").text
    movie_hash[:bio] = details.css(".outline").text.gsub(/\n/,"").strip
    movie_hash[:review_score] = details.css(".rating_txt .rating-rating").text
    movie_hash
    #binding.pry
  end
end
