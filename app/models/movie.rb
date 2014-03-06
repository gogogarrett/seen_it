# Not storing things efficently.. mostly just trying to learn how this sucker works.
# Will look into MotionModel.. or CoreData?
class Movie
  attr_accessor :title, :year, :rated, :plot, :poster, :imdb_id, :genre,
          :director, :actors, :imdb_rating


  def initialize(value_hash)
    new_hash = {}
    value_hash.each_pair { |k,v| new_hash.merge!({k.downcase => v}) }

    # TODO: refactor this to not suck
    # meta program like a boss.com.au
    @title        = new_hash['title']
    @year         = new_hash['year']
    @rated        = new_hash['rated']       || "x"
    @plot         = new_hash['plot']        || "x"
    @poster       = new_hash['poster']      || "x"
    @imdb_id      = new_hash['imdbid']      || "x"
    @genre        = new_hash['genre']       || "x"
    @director     = new_hash['director']    || "x"
    @actors       = new_hash['actors']      || "x"
    @imdb_rating  = new_hash['imdbrating']  || "x"
  end

  def to_json
    {
      title: @title, year: @year, rated: @rated, plot: @plot, poster: @poster,
      imdb_id: @imdb_id, genre: @genre, director: @director, actors: @actors,
      imdb_rating: @imdb_rating,
    }
  end
end

# API Stuff:
#
# important?
# title/year/rated/genre/director/actors/imdb_rating

# /movie/1
# {"Title":"Alien","Year":"1979","Rated":"R","Released":"22 Jun 1979","Runtime":"117 min",
#   "Genre":"Horror, Sci-Fi","Director":"Ridley Scott",
#   "Writer":"Dan O'Bannon (story), Ronald Shusett (story), Dan O'Bannon (screenplay)",
#   "Actors":"Tom Skerritt, Sigourney Weaver, Veronica Cartwright, Harry Dean Stanton",
#   "Plot":"The commercial vessel Nostromo receives a distress call from an unexplored planet. After searching for survivors, the crew heads home only to realize that a deadly bioform has joined them.",
#   "Language":"English, Spanish","Country":"USA, UK","Awards":"Won 1 Oscar. Another 12 wins & 18 nominations.",
#   "Poster":"http://ia.media-imdb.com/images/M/MV5BMTk3NzkwMjA3OV5BMl5BanBnXkFtZTYwMTIwOTk2._V1_SX300.jpg",
#   "Metascore":"83","imdbRating":"8.5","imdbVotes":"386,044","imdbID":"tt0078748","Type":"movie","Response":"True"}

# /movies
# {"Search":
#   [
#     {"Title":"Ghostbusters","Year":"1984","imdbID":"tt0121318","Type":"movie"},
#     {"Title":"Ghostbusters","Year":"1984","imdbID":"tt0087332","Type":"movie"},
#     {"Title":"Ghostbusters II","Year":"1989","imdbID":"tt0097428","Type":"movie"},
#     {"Title":"Extreme Ghostbusters","Year":"1997–","imdbID":"tt0121932","Type":"series"},
#     {"Title":"Ghostbusters","Year":"2009","imdbID":"tt1142978","Type":"game"},
#     {"Title":"Ghostbusters","Year":"2009","imdbID":"tt1142978","Type":"game"},
#     {"Title":"The Real Ghostbusters","Year":"2009","imdbID":"tt1533530","Type":"episode"},
#     {"Title":"Ghostbusters","Year":"1986–1987","imdbID":"tt0127569","Type":"series"},
#     {"Title":"Freddy VS Ghostbusters","Year":"2004","imdbID":"tt0439576","Type":"movie"},
#     {"Title":"Return of the Ghostbusters","Year":"2007","imdbID":"tt1230164","Type":"movie"}
#   ]
# }
