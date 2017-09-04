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
    binding.pry
  end

  def self.scrape_movie_page(movie_url)
    movie_page = Nokogiri::HTML(open(movie_url))

  end
end

BestMoviesEver::Scraper.scrape_index_page("https://www.rottentomatoes.com/top/bestofrt/") # My testing environment
# index_page.css("a.unstyled.articleLink").text onto something with this.
# index_page.css("table.table td a.unstyled.articleLink").text getting warmer

# first_film = index_page.css("table.table tr")[1] # getting warmer, must start from 1, as 0 is for the titles
# rank = first_film.css("td.bold").text
# rating = first_film.css("td span.tMeterScore").text.strip #=> _99%  not happy about the space but just move on
# title = first_film.css("td a").text.strip #=> "The Wizard of Oz (1939)"
# num_of_reviews = first_film.css("td.right").text #=> "110"


# movies = [{rank: "1", rating: "99%" title: "The Wizard of Oz (1939)", num_of_reviews: "110"},
#   {rank: "2", rating: "100%" title: "Citizen Kane (1941)", num_of_reviews: "75"},
#   {rank: "3", rating: "100%" title: "The Third Man (1949)", num_of_reviews: "77"}]
