class MoviesController < UIViewController

  def init
    super
    self.title = "Seen movies"
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemTopRated, tag: 1)
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.scrollViewTexturedBackgroundColor
  end
end
