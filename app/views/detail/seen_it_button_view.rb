module Detail
  class SeenItButtonView < UIView

    def self.initWithMovie(movie, controller, sub_view)
      DetailStylesheet.seen_it_button.tap do |l|
        l.frame = [[70, sub_view.frame.origin.y + sub_view.frame.size.height + 20], [160, 50]]
        l.addTarget(controller, action: :seen_it, forControlEvents:UIControlEventTouchUpInside)
      end
    end
  end
end
