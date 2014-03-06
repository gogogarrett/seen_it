class DetailController < UIViewController
  attr_accessor :movie

  def loadView
    self.view = UIScrollView.new
    self.view.contentSize = CGSizeMake(320, 900)
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    App::Persistence['movies'] ||= []
    show_movie_detail
  end

  def show_movie_detail
    # TODO: refaxtor zomg this is bad.
    # look into Motion::Layout
    # look into Stylesheet approach
    # look into being a better dev <3

    show_title
    show_imdb_rating

    show_image

    show_year
    show_rated

    show_genre

    show_directors
    show_actors

    show_plot

    seen_it_button
  end

  def show_title
    label = UILabel.alloc.init
    label.frame = [[20, 20], [200, 25]]
    label.textColor = UIColor.darkGrayColor
    label.setAdjustsFontSizeToFitWidth(true)
    label.text = @movie.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    view.addSubview(label)
  end

  def show_imdb_rating
    label = UILabel.alloc.init
    label.frame = [[230, 20], [120, 25]]
    label.textColor = UIColor.darkGrayColor
    label.setAdjustsFontSizeToFitWidth(true)
    label.text = @movie.imdb_rating
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    view.addSubview(label)
  end

  def show_image
    @imageView = UIImageView.alloc.initWithFrame([[20, 65], [280, 320]])
    @imageView.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@movie.poster)))
    view.addSubview(@imageView)
  end

  def show_year
    @year_label = UILabel.alloc.init
    @year_label.frame = [[20, @imageView.frame.origin.y + @imageView.frame.size.height + 12], [200, 40]]
    @year_label.textColor = UIColor.darkGrayColor
    @year_label.setAdjustsFontSizeToFitWidth(true)
    @year_label.text = "Year: #{@movie.year}"
    @year_label.lineBreakMode = UILineBreakModeWordWrap;
    @year_label.numberOfLines = 0
    @year_label.sizeToFit
    view.addSubview(@year_label)
  end

  def show_rated
    @rated_label = UILabel.alloc.init
    @rated_label.frame = [[20, @year_label.frame.origin.y + @year_label.frame.size.height + 12], [200, 40]]
    @rated_label.textColor = UIColor.darkGrayColor
    @rated_label.setAdjustsFontSizeToFitWidth(true)
    @rated_label.text = "Rated: #{@movie.rated}"
    @rated_label.lineBreakMode = UILineBreakModeWordWrap;
    @rated_label.numberOfLines = 0
    view.addSubview(@rated_label)
  end

  def show_genre
    @genre_label = UILabel.alloc.init
    @genre_label.frame = [[20, @rated_label.frame.origin.y + @rated_label.frame.size.height + 12], [200, 40]]
    @genre_label.textColor = UIColor.darkGrayColor
    @genre_label.setAdjustsFontSizeToFitWidth(true)
    @genre_label.text = "Genre: #{@movie.genre}"
    @genre_label.lineBreakMode = UILineBreakModeWordWrap;
    @genre_label.numberOfLines = 0
    @genre_label.sizeToFit
    view.addSubview(@genre_label)
  end

  def show_directors
    @directors_label = UILabel.alloc.init
    @directors_label.frame = [[20, @genre_label.frame.origin.y + @genre_label.frame.size.height + 12], [200, 40]]
    @directors_label.textColor = UIColor.darkGrayColor
    @directors_label.setAdjustsFontSizeToFitWidth(true)
    @directors_label.text = "Directors: #{@movie.director}"
    @directors_label.lineBreakMode = UILineBreakModeWordWrap;
    @directors_label.numberOfLines = 0
    view.addSubview(@directors_label)
  end

  def show_actors
    @actor_label = UILabel.alloc.init
    @actor_label.frame = [[20, @directors_label.frame.origin.y + @directors_label.frame.size.height + 12], [200, 40]]
    @actor_label.textColor = UIColor.darkGrayColor
    @actor_label.setAdjustsFontSizeToFitWidth(true)
    @actor_label.text = "Actors: #{@movie.actors}"
    @actor_label.lineBreakMode = UILineBreakModeWordWrap;
    @actor_label.numberOfLines = 0
    @actor_label.sizeToFit
    view.addSubview(@actor_label)
  end

  def show_plot
    @plot_label = UILabel.alloc.init
    @plot_label.frame = [[20, @actor_label.frame.origin.y + @actor_label.frame.size.height + 12], [280, 200]]
    @plot_label.textColor = UIColor.darkGrayColor
    @plot_label.setAdjustsFontSizeToFitWidth(true)
    @plot_label.text = "Plot:\n#{@movie.plot}"
    @plot_label.lineBreakMode = UILineBreakModeWordWrap;
    @plot_label.numberOfLines = 0
    @plot_label.sizeToFit
    view.addSubview(@plot_label)
  end

  def seen_it_button
    gallery_button = UIButton.buttonWithType(UIButtonTypeSystem)
    gallery_button.setBackgroundImage(UIImage.imageNamed("seen_it.png"), forState:UIControlStateNormal)
    gallery_button.setBackgroundImage(UIImage.imageNamed("seen_it_sel.png"), forState:UIControlStateSelected | UIControlStateHighlighted)
    gallery_button.frame = [[70, @plot_label.frame.origin.y + @plot_label.frame.size.height + 20], [160, 50]]
    gallery_button.addTarget(self, action: :seen_it, forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(gallery_button)
  end

  def seen_it
    array = App::Persistence['movies'].dup
    array << @movie.to_json
    App::Persistence['movies'] = array
    a = UIAlertView.alloc.initWithTitle("Yay!", message: "Movie has been added!", delegate: self, cancelButtonTitle: "Cheers", otherButtonTitles: nil)
    a.show
  end

  def alertView(alertView, clickedButtonAtIndex:buttonIndex)
    self.navigationController.popViewControllerAnimated(animated: true)
  end
end
