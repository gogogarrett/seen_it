class DetailStylesheet
  class << self

    def common_fields(l)
      l.textColor = UIColor.darkGrayColor
      l.setAdjustsFontSizeToFitWidth(true)
      l.lineBreakMode = UILineBreakModeWordWrap;
      l.numberOfLines = 0
    end

    def general_label
      UILabel.new.tap { |label| common_fields(label) }
    end

    def size_to_fit_general_label
      general_label.tap do |label|
        label.sizeToFit
      end
    end

    def movie_image
      UIImageView.alloc.init.tap do |iv|
      end
    end

    def seen_it_button
      UIButton.new.tap do |b|
        b.setBackgroundImage(UIImage.imageNamed("seen_it.png"), forState:UIControlStateNormal)
        b.setBackgroundImage(UIImage.imageNamed("seen_it_sel.png"), forState:UIControlStateSelected)
        b.setBackgroundImage(UIImage.imageNamed("seen_it_sel.png"), forState:UIControlStateHighlighted)
        b.setBackgroundImage(UIImage.imageNamed("seen_it_sel.png"), forState:UIControlStateSelected | UIControlStateHighlighted)
      end
    end
  end
end
