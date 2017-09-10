class BestMoviesEver::CLI
  def call
    puts "Come see Rotten Tomatoes' list of 100 best films ever!"
    movies = BestMoviesEver::Scraper.scrape_index_page("https://www.rottentomatoes.com/top/bestofrt/")
    movies_objs = BestMoviesEver::Movie.create_from_collection(movies)
    start
  end

  def start
      puts ""
    BestMoviesEver::Movie.all.each do |movie|
      puts "#{movie.rank} #{movie.title}"
    end
    puts "---------------------------------------------"
    input = nil
    while input.to_i < 1 || input.to_i > 100
      puts "Type the rank of the movie to find out more about the specific film."
      input = gets.strip.to_i
    end
    movie = BestMoviesEver::Movie.find(input)
    movie_addl_info = BestMoviesEver::Scraper.scrape_movie_page(movie.url)
    movie.add_movie_attributes(movie_addl_info)
    puts ""
    puts "#{movie.title}"
    puts ""
    puts "Tomato Meter: #{movie.rating}"
    puts "Audience Score: #{movie.audience_score}"
    puts "---------------------------------------------"
    puts "Critics Consensus:"
    puts ""
    puts "#{movie.critics_consensus}"
    puts "---------------------------------------------"
    puts "Synopsis:"
    puts ""
    puts "#{movie.synopsis}"
    puts ""
    puts "Would you like to see the list again? Y/N"
    input2 = gets.strip.upcase
    if input2 == "Y"
      start
    else
      puts ""
      puts "Okay, come back again soon!"
    end
  end

end
