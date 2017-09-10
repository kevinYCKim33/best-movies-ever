# Specifications for the CLI Assessment

Specs:
- [X] Have a CLI for interfacing with the application
    The bin file best-movies-ever calls on the class BestMoviesEver::CLI, an instance method of #call.

    The #call method puts out a Welcome message alerting the user that this is the list of 100 best films according to Rotten Tomatoes.  It then scrapes the index page of Rotten Tomatoes listing the 100 films. #call will then call on #start.

    In #start, the user will be able to see the hundred best films listed in the terminal, and be prompted to type the rank of the movie from 1~100 if they would like to find out more information on the specific film, such as audience score, the critics' consensus, and synopsis of the film.  

    When the information of a specific movie is displayed, the user will be prompted if he or she would like to see the list again, which will recurse back to the #start function. Otherwise, the program will bid the user farewell, and exit out of the program.

- [X] Pull data from an external source:
    There are two scraping methods present in the Scraper class.  

    .scrape_index_page(index_url):
    This method loads up Rotten Tomatoes' Top 100 Movies of All Time HTML page: ("https://www.rottentomatoes.com/top/bestofrt/") and scrapes out each film's rank, rating, title, and url and stores them in a hash.

    .scrape_movie_page(movie_url)
    This method takes in a url attained from the .scrape_index_page method and scrapes out an individual film's critics' consensus, the audience rating, and the film synopsis.

- [X] Implement both list and detail views
    The movies are listed by their rank as the program executes.  When the user inputs the rank of a film, details on the film is displayed, such as the critics' consensus, the audience rating, and the synopsis of the film.  
