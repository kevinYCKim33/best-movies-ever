# My testing modules just for the Scraper
module BestMoviesEver
end
require 'pry'
require 'nokogiri'
require 'open-uri'
# ^^ My testing modules just for the Scraper

class BestMoviesEver::Movie
  attr_accessor :rank, :rating, :title, :num_of_reviews, :url, :critics_consensus, :audience_score, :synopsis

  @@all = []

  def intiialize(movie_hash)
    movie_hash.each{|attribute, value| self.send("#{attribute}=", value)}
    @@all << self
  end

  def self.create_from_collection(movies_array)
    movies_array.map{|movie_hash| self.new(movie_hash)}
  end

  # add additonal movie attributes such as critics consensus, audience score, synopsis
  def add_movie_attributes(attributes_hash)
    attributes_hash.each{|attribute, value| self.send("#{attribute}=", value)}
    self
  end

  def self.all
    @@all
  end
end

wiz_hash = {
  rank: "1",
  rating: "99%",
  title: "The Wizard of Oz (1939)",
  num_of_reviews: "110",
  url: "https://www.rottentomatoes.com/m/the_wizard_of_oz_1939"
}

# movies_array = [{rank: "1", rating: "99%" title: "The Wizard of Oz (1939)", num_of_reviews: "110", url: "www.adsjldalsk"},
#   {rank: "2", rating: "100%" title: "Citizen Kane (1941)", num_of_reviews: "75", url: "www.adsjklafdl"},
#   {rank: "3", rating: "100%" title: "The Third Man (1949)", num_of_reviews: "77"}]

addl_info = {
  critics_consensus: "it's good",
  audience_score: "100%",
  synposis: "4 characters go somewhere."
}
