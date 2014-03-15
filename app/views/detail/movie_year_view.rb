module Detail
  class MovieYearView < UIView

    def self.initWithMovie(movie, sub_view)
      DetailStylesheet.general_label.tap do |l|
        l.frame = [[20, sub_view.frame.origin.y + sub_view.frame.size.height + 12], [200, 40]]
        l.text = "Year: #{movie.year}"
      end
    end
  end
end
