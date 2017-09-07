class BestMoviesEver::Scraper
  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    movies = []
    index_page.css("table.table tr").drop(1).each do |movie|
      movie_hash = {
        rank: movie.css("td.bold").text,
        rating: movie.css("td span.tMeterScore").text.slice(1,5),
        title: movie.css("td a").text.strip,
        url: "https://rottentomatoes.com" + movie.css("td a").attribute("href").value
      }
      movies << movie_hash
    end
    movies
  end

  def self.scrape_movie_page(movie_url)
    movie_page = Nokogiri::HTML(open(movie_url, :allow_redirections => :all))
                                    #^^never would have figured out in years
    addl_info = {
      critics_consensus: movie_page.css("p.critic_consensus").first.text.slice(68,1000),
      audience_score: movie_page.css("div.meter-value").text.strip,
      synopsis: movie_page.css("div#movieSynopsis").text.strip
    }
    addl_info
  end
end
