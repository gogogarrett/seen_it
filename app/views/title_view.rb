class TitleView < UIScrollView

  def init
    super.tap do |tv|
      tv.addSubview(
        UILabel.alloc.init.tap do |l|
          l = UILabel.alloc.init
          l.frame = [[20, 20], [200, 25]]
          l.textColor = UIColor.darkGrayColor
          l.setAdjustsFontSizeToFitWidth(true)
          l.text = @movie.title
          l.lineBreakMode = UILineBreakModeWordWrap;
          l.numberOfLines = 0
        end
      )
    end
  end

end
