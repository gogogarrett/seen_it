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

    # stub out "persisted" data.
    url = "http://www.omdbapi.com/?t=alien"
    json = JSONParser.parse_from_url(url)
    # @movies << m1
    m1 = Movie.new(json)


    url = "http://www.omdbapi.com/?t=ghost"
    json = JSONParser.parse_from_url(url)
    # @movies << m2
    m2 = Movie.new(json)

    url = "http://www.omdbapi.com/?t=inception"
    json = JSONParser.parse_from_url(url)
    # @movies << m3
    m3 = Movie.new(json)

    label = UILabel.new
    label.text = m1.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.frame = [[50,100],[250,50]]
    view.addSubview(label)

    label = UILabel.new
    label.text = m2.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.frame = [[50,150],[250,50]]
    view.addSubview(label)

    label = UILabel.new
    label.text = m3.title
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.frame = [[50,200],[250,50]]
    view.addSubview(label)

    # @movies.each do |m|
    #   add_movie(m)
    # end
  end

  def add_movie(movie)
    add_movie_details(movie, :title)
    add_movie_details(movie, :plot)
  end

  def add_movie_details(movie, field)
    label = UILabel.new
    label.text = movie.send(field)
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.frame = [[50,50],[250,50]] # fix frame issue
    view.addSubview(label)
  end
end
