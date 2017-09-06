class BestMoviesEver::Movie
  attr_accessor :rank, :rating, :title, :num_of_reviews, :url, :critics_consensus, :audience_score, :synopsis

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
end
