class Movie
  attr_accessor :title, :year, :rated, :plot, :poster

  def initialize(value_hash)
    new_hash = {}
    value_hash.each_pair { |k,v| new_hash.merge!({k.downcase => v}) }

    @title  = new_hash['title']
    @year   = new_hash['year']
    @rated  = new_hash['rated']
    @plot   = new_hash['plot']
    @poster = new_hash['poster']
  end

  def to_json
    {title: @title, year: @year, rated: @rated, plot: @plot, poster: @poster}
  end
end
