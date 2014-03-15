module Detail
  class MovieTitleView < UIView

    def self.initWithMovie(movie)
      DetailStylesheet.general_label.tap do |l|
        l.frame = [[20, 20], [200, 25]]
        l.text = movie.title
      end
    end
  end
end
