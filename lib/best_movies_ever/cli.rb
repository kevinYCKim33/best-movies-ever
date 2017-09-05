class BestMoviesEver::CLI
  def call
    puts "Come see Rotten Tomatoes' list of 100 best films ever!"
    start
  end

  def start
    movies = BestMoviesEver::Scraper.scrape_index_page("https://www.rottentomatoes.com/top/bestofrt/")
    movies_objs = BestMoviesEver::Movie.create_from_collection(movies)
    movies_objs.each do |movie|
      puts "#{movie.rank}#{movie.title}"
      puts "  Rating: #{movie.rating}"
      puts "  Number of Reviews: #{movie.num_of_reviews}"
      
    end
  end

end

# index_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
