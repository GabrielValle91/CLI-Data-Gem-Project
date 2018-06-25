class MovieScraper
  def self.scrape_movie_overview(overview_url, zip_code)
    html = open(overview_url)
    doc = Nokogiri::HTML(html)
    movie_array = []

    movie_list = doc.css(".lister-item")
    movie_list.each do |movie|
      movie_hash = {}
      movie_hash[:name] = movie.css(".title").text
      movie_hash[:url] = ("https://www.imdb.com" + movie.css("a").attribute("href").value.gsub("?ref_=shlc_li_i","") + "US/" + zip_code).chomp
      movie_array << movie_hash
    end

    movie_array
  end

  def self.scrape_movie_details(movie_url)
    movie_hash = {}
    html = open(movie_url)
    doc = Nokogiri::HTML(html)
    details = doc.css(".cert-runtime-genre")
    if doc.search(".cert-runtime-genre img").size > 0
      movie_hash[:rating] = details.css("img").attribute("title").value
    else
      movie_hash[:rating] = "no rating"
    end
    movie_hash[:length] = details.css("time").text
    movie_hash[:genre] = details.css("span").text
    movie_hash[:bio] = doc.css(".outline").text.gsub(/\n/,"").strip
    movie_hash[:review_score] = doc.css(".rating_txt .rating-rating").text
    movie_hash
  end
end
