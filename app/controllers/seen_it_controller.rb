class SeenItController < UIViewController

  def init
    super
    self.title = "Search for movies!"
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag: 1)
    self
  end

  def viewDidLoad
    super
    view.backgroundColor = UIColor.redColor
    @search_bar = UISearchBar.alloc.initWithFrame([[0,0], [self.view.size.width, 150]])
    @search_bar.placeholder = "Place keyword here"
    @search_bar.setShowsCancelButton(true, animated:true)
    @search_bar.resignFirstResponder
    @search_bar.delegate = self
    view.addSubview(@search_bar)
  end

  def searchBarSearchButtonClicked(searchBar)
    query = searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = "http://www.omdbapi.com/?t=#{query}"
    json = nil
    begin
      json = JSONParser.parse_from_url(url)
    rescue RuntimeError => e
      presentError e.message
    end

    @movie = Movie.new(json)

    label = UILabel.alloc.init
    label.frame = [[0, 150], [300, 120]]
    label.backgroundColor = UIColor.clearColor
    label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold",size:22)
    label.text = @movie.title
    view.addSubview(label)

    label = UILabel.alloc.init
    label.frame = [[0, 200], [300, 500]]
    label.backgroundColor = UIColor.clearColor
    label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold",size:15)
    label.numberOfLines = 0
    label.text = @movie.plot
    view.addSubview(label)

    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
end
