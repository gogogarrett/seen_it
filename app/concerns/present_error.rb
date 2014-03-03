module PresentError
  def presentError(error)
    alert = UIAlertView.new
    alert.message = error
    alert.show
  end
end
