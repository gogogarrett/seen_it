class DetailView < UIScrollView
  attr_accessor :movie, :controller

  def init
    super.tap do |ov|
      ov.addSubview(
        DetailStylesheet.general_label.tap do |l|
          l.frame = [[20, 20], [200, 25]]
          l.text = @movie.title
        end
      )

      ov.addSubview(
        DetailStylesheet.general_label.tap do |l|
          l.frame = [[230, 20], [120, 25]]
          l.text = @movie.imdb_rating
        end
      )

      ov.addSubview(
        @imageView = DetailStylesheet.movie_image.tap do |l|
          l.frame = [[20, 65], [280, 320]]
          l.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@movie.poster)))
        end
      )

      ov.addSubview(
        @year_label = DetailStylesheet.size_to_fit_general_label.tap do |l|
          l.frame = [[20, @imageView.frame.origin.y + @imageView.frame.size.height + 12], [200, 40]]
          l.text = "Year: #{@movie.year}"
        end
      )

      ov.addSubview(
        @rated_label = DetailStylesheet.general_label.tap do |l|
          l.frame = [[20, @year_label.frame.origin.y + @year_label.frame.size.height + 12], [200, 40]]
          l.text = "Rated: #{@movie.rated}"
        end
      )

      ov.addSubview(
        @genre_label = DetailStylesheet.size_to_fit_general_label.tap do |l|
          l.frame = [[20, @rated_label.frame.origin.y + @rated_label.frame.size.height + 12], [200, 40]]
          l.text = "Genre: #{@movie.genre}"
        end
      )

      ov.addSubview(
        @directors_label = DetailStylesheet.general_label.tap do |l|
          l.frame = [[20, @genre_label.frame.origin.y + @genre_label.frame.size.height + 12], [200, 40]]
          l.text = "Directors: #{@movie.director}"
        end
      )

      ov.addSubview(
        @actor_label = DetailStylesheet.size_to_fit_general_label.tap do |l|
          l.frame = [[20, @directors_label.frame.origin.y + @directors_label.frame.size.height + 12], [200, 40]]
          l.text = "Actors: #{@movie.actors}"
        end
      )

      ov.addSubview(
        @plot_label = DetailStylesheet.size_to_fit_general_label.tap do |l|
          l.frame = [[20, @actor_label.frame.origin.y + @actor_label.frame.size.height + 12], [280, 200]]
          l.text = "Plot:\n#{@movie.plot}"
        end
      )

      ov.addSubview(
        DetailStylesheet.seen_it_button.tap do |l|
          l.frame = [[70, @plot_label.frame.origin.y + @plot_label.frame.size.height + 20], [160, 50]]
          l.addTarget(self.controller, action: :seen_it, forControlEvents:UIControlEventTouchUpInside)
        end
      )
    end

    self.contentSize = CGSizeMake(320, 1000)
  end
end
