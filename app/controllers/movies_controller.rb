class MoviesController < UIViewController

  def init
    super
    self.title = "Seen movies"
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemTopRated, tag: 1)
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.scrollViewTexturedBackgroundColor
    add_seen_movies
  end

  def add_seen_movies
    @movies = []
    @movies = App::Persistence['movies'].uniq.map{|x| Movie.new(x) }

    @movies.each_with_index do |movie, index|
      label = UILabel.new
      label.text = movie.title
      label.lineBreakMode = UILineBreakModeWordWrap;
      label.numberOfLines = 0

      if !@last_label.nil?
        label.frame = [
          [0, @last_label.frame.origin.y + 50],
          [250, 50]
        ]
      else
        label.frame = [[0, 100], [250, 50]]
      end

      @last_label = label
      view.addSubview(label)
    end
  end
end
