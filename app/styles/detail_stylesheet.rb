class DetailStylesheet
  class << self
    def title
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
      end
    end

    def imdb_rating
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
      end
    end

    def movie_image
      UIImageView.alloc.init.tap do |iv|
        # iv.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@movie.poster)))
      end
    end

    def movie_year
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
        l.sizeToFit
      end
    end

    def movie_rated
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
      end
    end

    def movie_genre
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
        l.sizeToFit
      end
    end

    def movie_directors
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
      end
    end

    def movie_actors
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
        l.sizeToFit
      end
    end

    def movie_plot
      UILabel.new.tap do |l|
        l.textColor = UIColor.darkGrayColor
        l.setAdjustsFontSizeToFitWidth(true)
        l.lineBreakMode = UILineBreakModeWordWrap;
        l.numberOfLines = 0
        l.sizeToFit
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
