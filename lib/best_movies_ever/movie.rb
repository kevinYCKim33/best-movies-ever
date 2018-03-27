class BestMoviesEver::Movie
  attr_accessor :year, :rank, :rating, :title, :url, :critics_consensus, :audience_score, :synopsis

  @@all = []

  def initialize(movie_hash)
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

  def self.find(rank)
    @@all[rank - 1]
  end

  def self.movies_released_between(min_year, max_year)
    @@all.select { |movie| movie.year >= min_year && movie.year <= max_year }
  end
  #BestMoviesEver::Movie.movies_released_between(1990, 2014)
end

# [1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]
