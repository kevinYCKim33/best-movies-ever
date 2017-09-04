# My testing modules just for the Scraper
module BestMoviesEver
end
require 'pry'
require 'nokogiri'
require 'open-uri'
# ^^ My testing modules just for the Scraper

class BestMoviesEver::Scraper
  def self.scrape_index_page(index_url)
    # index_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    index_page = Nokogiri::HTML(open(index_url))
    movies = []
    index_page.css("table.table tr").drop(1).each do |movie|
      movie_hash = {
        rank: movie.css("td.bold").text,
        rating: movie.css("td span.tMeterScore").text.slice(1,5),
        title: movie.css("td a").text.strip,
        num_ofreviews: movie.css("td.right").text,
        url: "https://rottentomatoes.com" + movie.css("td a").attribute("href").value
      }
      movies << movie_hash
    end
    movies
  end

  def self.scrape_movie_page(movie_url)
    movie_page = Nokogiri::HTML(open(movie_url))
    # binding.pry
    addl_info = {
      critics_consensus: movie_page.css("p.critic_consensus").first.text.slice(68,1000), #hack method
      audience_score: movie_page.css("div.meter-value").text.strip,
      movie_info: movie_page.css("div#movieSynopsis").text.strip
    }
    addl_info
    binding.pry
  end
end

BestMoviesEver::Scraper.scrape_index_page("https://www.rottentomatoes.com/top/bestofrt/") # My testing environment
BestMoviesEver::Scraper.scrape_movie_page("https://www.rottentomatoes.com/m/1000626_all_about_eve")



# movies = [{rank: "1", rating: "99%" title: "The Wizard of Oz (1939)", num_of_reviews: "110"},
#   {rank: "2", rating: "100%" title: "Citizen Kane (1941)", num_of_reviews: "75"},
#   {rank: "3", rating: "100%" title: "The Third Man (1949)", num_of_reviews: "77"}]

# a_movie = {
#   critics_consensus: "Smart, sophisticated, and devastatingly funny, All About Eve is a Hollywood classic that only improves with age.",
#   audience_score: "94%",
#   movie_info: "Base"Fasten your seat belts. It's going to be a bumpy night." All About Eve received 6 Academy Awards, including Best Picture. ~ Hal Erickson, Rovi"
# }
