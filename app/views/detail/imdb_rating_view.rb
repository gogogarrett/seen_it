module Detail
  class IMDBRatingView < UIView

    def self.initWithMovie(movie)
      DetailStylesheet.general_label.tap do |l|
        l.frame = [[230, 20], [120, 25]]
        l.text = movie.imdb_rating
      end
    end
  end
end
