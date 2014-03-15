module Detail
  class MovieGenreView < UIView

    def self.initWithMovie(movie, sub_view)
      DetailStylesheet.size_to_fit_general_label.tap do |l|
        l.frame = [[20, sub_view.frame.origin.y + sub_view.frame.size.height + 12], [200, 40]]
        l.text = "Genre: #{movie.genre}"
      end
    end
  end
end
