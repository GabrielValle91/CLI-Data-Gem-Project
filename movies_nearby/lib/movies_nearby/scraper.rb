class MovieScraper
  def self.scrape_movie_overview(overview_url, zip_code)
    html = open(overview_url)
    doc = Nokogiri::HTML(html)
    movie_array = []


    movie_array
  end
end
