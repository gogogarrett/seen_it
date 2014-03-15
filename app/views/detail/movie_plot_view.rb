module Detail
  class MoviePlotView < UIView

    def self.initWithMovie(movie, sub_view)
      DetailStylesheet.size_to_fit_general_label.tap do |l|
        l.frame = [[20, sub_view.frame.origin.y + sub_view.frame.size.height + 12], [280, 200]]
        l.text = "Plot:\n#{movie.plot}"
      end
    end
  end
end
