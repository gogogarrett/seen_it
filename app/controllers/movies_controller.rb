class MoviesController < UIViewController

  def init
    super
    self.title = "Seen movies"
    self.tabBarItem.image = UIImage.imageNamed('seen_it_icon.png')
    self
  end

  def loadView
    self.view = UIScrollView.new
    self.view.contentSize = CGSizeMake(320, 800)
  end

  def viewWillAppear(animated)
    add_seen_movies
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
  end

  def add_seen_movies
    @movies = []
    if App::Persistence['movies']
      @movies = App::Persistence['movies'].uniq.map{|x| Movie.new(x) }.uniq
    end

    @movies.each_with_index do |movie, index|

      # I feel like this is hacky.. There should be a better way to do this?..
      should_skip = false
      view.subviews.each do |view|
        if view.is_a?(UILabel) && view.text == movie.title
          should_skip = true
        end
      end
      next if should_skip

      label = UILabel.new
      label.text = movie.title
      label.lineBreakMode = UILineBreakModeWordWrap;
      label.numberOfLines = 0

      if !@last_label.nil?
        label.frame = [
          [20, @last_label.frame.origin.y + 50],
          [250, 50]
        ]
      else
        label.frame = [[20, 30], [250, 50]]
      end

      @last_label = label

      view.addSubview(label)
    end
  end
end
