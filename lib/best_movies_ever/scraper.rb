# My testing modules just for the Scraper
module BestMoviesEver
end
require 'pry'
require 'nokogiri'
require 'open-uri'
# ^^ My testing modules just for the Scraper

class BestMoviesEver::Scraper
  def scrape_index_page
    index_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
    binding.pry
  end

end


BestMoviesEver::Scraper.new.scrape_index_page # My testing environment
# index_page.css("a.unstyled.articleLink").text onto something with this.
# index_page.css("table.table td a.unstyled.articleLink").text getting warmer

index_page.css("table.table td a.unstyled.articleLink").text.strip #=> lists all movie titles in the website.
index_page.css("table.table td a.unstyled.articleLink").first.text.strip #=> "The Wizard of Oz (1939)"
index_page.css("table.table td a.unstyled.articleLink").last.text.strip #=> "Lawrence of Arabia (1962)"

first_film = index_page.css("table.table tr")[1] # getting warmer, must start from 1, as 0 is for the titles
rank = first_film.css("td.bold").text
rating = first_film.css("td span.tMeterScore").text.strip #=> _99%  not happy about the space but just move on
title = first_film.css("td a").text.strip #=> "The Wizard of Oz (1939)"
num_of_reviews = first_film.css("td.right").text #=> "110"


# movies = [{rank: "1", rating: "99%" title: "The Wizard of Oz (1939)", num_of_reviews: "110"},
#   {rank: "2", rating: "100%" title: "Citizen Kane (1941)", num_of_reviews: "75"},
#   {rank: "3", rating: "100%" title: "The Third Man (1949)", num_of_reviews: "77"}]
