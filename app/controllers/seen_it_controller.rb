class SeenItController < UITableViewController
  include PresentError

  def init
    super
    self.tabBarItem.image = UIImage.imageNamed('glasses.png')
    self.title = "Seen it?"
    self
  end

  def viewDidLoad
    super
    @movies = []

    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self
    searchBar.showsCancelButton = true
    searchBar.sizeToFit
    searchBar.placeholder = "Search for a movie.."
    view.tableHeaderView = searchBar
    view.dataSource = view.delegate = self
    # searchBar.text = "Alien"
    # searchBarSearchButtonClicked(searchBar)
  end

  def searchBarSearchButtonClicked(searchBar)
    query = searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = "http://www.omdbapi.com/?s=#{query}"
    json = nil
    @movies.clear

    # abstract this so I don't have to duplicate it.
    begin
      json = JSONParser.parse_from_url(url)
    rescue RuntimeError => e
      presentError e.message
    end

    if json['Response'] == "False"
      presentError(json["Error"])
    else
      json["Search"].each do |movie_json|
        @movies << Movie.new(movie_json)
      end
    end

    view.reloadData
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @movies.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end
    cell.textLabel.text = @movies[indexPath.row].title
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    movie = @movies[indexPath.row]
    url = "http://www.omdbapi.com/?i=#{movie.imdb_id}"
    json = nil

    begin
      json = JSONParser.parse_from_url(url)
    rescue RuntimeError => e
      presentError e.message
    end

    if json['Response'] == "False"
      presentError(json["Error"])
    else
      movie = Movie.new(json)
      detail_controller = DetailController.alloc.init
      detail_controller.movie = movie
      self.navigationController.pushViewController(detail_controller, animated: true)
    end
  end
end
