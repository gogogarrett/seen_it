class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = createTabBar
    true
  end

  def createTabBar
    seenit_tab = UINavigationController.alloc.initWithRootViewController(SeenItController.alloc.init)
    seenit_tab.title = "Seen it?" # why does nav title not show up?
    seenit_tab.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag: 1)

    movies_tab = UINavigationController.alloc.initWithRootViewController(MoviesController.alloc.init)

    tab_bar = UITabBarController.alloc.init
    tab_bar.viewControllers = [seenit_tab, movies_tab]
    tab_bar.wantsFullScreenLayout = true
    tab_bar
  end
end

