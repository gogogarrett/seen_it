class DetailController < UIViewController
  attr_accessor :movie

  def viewDidLoad
    App::Persistence['movies'] ||= []
    show_movie_detail
  end

  def loadView
    self.view = UIScrollView.new
    self.view.contentSize= CGSizeMake(320,960)
  end

  def show_movie_detail
    show_title
    show_image
    show_plot
    seen_it_button
  end

  def show_title
    label = UILabel.alloc.init
    label.frame = [[0, 0], [320, 30]]
    label.backgroundColor = UIColor.blueColor
    label.text = @movie.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    view.addSubview(label)
  end

  def show_image
    imageView = UIImageView.alloc.initWithFrame([[0, 30], [320, 460]])
    imageView.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@movie.poster)))
    view.addSubview(imageView)
  end

  def show_plot
    label = UILabel.alloc.initWithFrame([[0,490], [320, 300]])
    label.textColor = UIColor.whiteColor
    label.backgroundColor = UIColor.blackColor
    label.text = @movie.plot
    label.numberOfLines = 0
    label.sizeToFit
    view.addSubview(label)
  end

  def seen_it_button
    gallery_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    gallery_button.frame  = [[0, 790], [200, 50]]
    gallery_button.setTitle("Seen it!", forState:UIControlStateNormal)
    gallery_button.addTarget(self, action: :seen_it, forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(gallery_button)
  end

  def seen_it
    array = App::Persistence['movies'].dup
    array << @movie.to_json
    App::Persistence['movies'] = array
    puts App::Persistence['movies'].inspect
  end
end
