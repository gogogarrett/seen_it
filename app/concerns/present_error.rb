module PresentError
  def presentError(error)
    alert = UIAlertView.alloc.initWithTitle("Error", message: error, delegate: self, cancelButtonTitle: "Ok", otherButtonTitles: nil)
    alert.show
  end
end
