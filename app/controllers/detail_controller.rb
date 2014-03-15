class DetailController < UIViewController
  attr_accessor :movie

  def loadView
    self.view = DetailView.alloc
    self.view.movie = @movie
    self.view.controller = self
    self.view.init
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    App::Persistence['movies'] ||= []
  end

  # delgate
  def seen_it
    array = App::Persistence['movies'].dup
    array << @movie.to_json
    App::Persistence['movies'] = array
    a = UIAlertView.alloc.initWithTitle("Yay!", message: "Movie has been added!", delegate: self, cancelButtonTitle: "Cheers", otherButtonTitles: nil)
    a.show
  end

  def alertView(alertView, clickedButtonAtIndex:buttonIndex)
    self.navigationController.popViewControllerAnimated(animated: true)
  end
end
