class Movie
  attr_accessor :title, :year, :rated, :plot, :poster

  def initialize(value_hash)
    @title = value_hash['Title']
    @year = value_hash['Year']
    @rated = value_hash['Rated']
    @plot = value_hash['Plot']
    @poster = value_hash['Poster']
  end
end
