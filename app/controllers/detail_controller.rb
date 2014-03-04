class DetailController < UIViewController
  attr_accessor :movie

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    show_movie_detail
  end

  def show_movie_detail
    show_title
    show_image
    show_plot
  end

  def show_title
    label = UILabel.alloc.init
    label.frame = [[0, 90], [300, 30]]
    label.backgroundColor = UIColor.blueColor
    label.text = @movie.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    view.addSubview(label)
  end

  def show_image
    # image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@movie.poster)))
    # view.addSubview(UIImageView.alloc.initWithImage(image))
  end

  def show_plot
    label = UILabel.alloc.init
    label.frame = [[0, 120], [300, 300]]
    label.backgroundColor = UIColor.redColor
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.text = @movie.plot
    view.addSubview(label)
  end
end
