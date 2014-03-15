class DetailView < UIScrollView
  attr_accessor :movie, :controller

  def init
    super.tap do |ov|
      ov.addSubview(Detail::MovieTitleView.initWithMovie(@movie))
      ov.addSubview(Detail::IMDBRatingView.initWithMovie(@movie))
      ov.addSubview(imageView = Detail::MovieImageView.initWithMovie(@movie))
      ov.addSubview(year_label = Detail::MovieYearView.initWithMovie(@movie, imageView))
      ov.addSubview(rated_label = Detail::MovieRatedView.initWithMovie(@movie, year_label))
      ov.addSubview(genre_label = Detail::MovieGenreView.initWithMovie(@movie, rated_label))
      ov.addSubview(directors_label = Detail::MovieDirectorView.initWithMovie(@movie, genre_label))
      ov.addSubview(actor_label = Detail::MovieActorView.initWithMovie(@movie, directors_label))
      ov.addSubview(plot_label = Detail::MoviePlotView.initWithMovie(@movie, actor_label))
      ov.addSubview(Detail::SeenItButtonView.initWithMovie(@movie, controller, plot_label))
    end

    self.contentSize = CGSizeMake(320, 1000)
  end
end
