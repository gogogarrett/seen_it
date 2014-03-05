class SeenItController < UITableViewController

  def init
    super
    self.title = "Search for movies!"
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag: 1)
    self
  end

  def viewDidLoad
    super
    @movies = []

    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self
    searchBar.showsCancelButton = true
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
    view.dataSource = view.delegate = self
    searchBar.text = "Alien"
    searchBarSearchButtonClicked(searchBar)
  end

  def searchBarSearchButtonClicked(searchBar)
    query = searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = "http://www.omdbapi.com/?t=#{query}"
    json = nil
    @movies.clear
    begin
      json = JSONParser.parse_from_url(url)
    rescue RuntimeError => e
      presentError e.message
    end

    @movies << Movie.new(json)

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
    cell.imageView.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.alloc.initWithString(@movies[indexPath.row].poster)))
    cell.detailTextLabel.text = @movies[indexPath.row].plot

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    detail_controller = DetailController.alloc.init
    detail_controller.movie = @movies[indexPath.row]
    self.navigationController.pushViewController(detail_controller, animated: true)
  end
end
