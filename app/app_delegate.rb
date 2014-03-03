class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = createTabBar
    @window.makeKeyAndVisible

    true
  end

  def createTabBar
    tab_bar_controller = UITabBarController.alloc.init
    tab_bar_controller.viewControllers = [
      SeenItController.alloc.init,
      MoviesController.alloc.init,
    ]
    tab_bar_controller
  end
end

