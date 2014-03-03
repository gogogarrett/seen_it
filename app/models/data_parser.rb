class DataParser

  def self.parse(url)
    error_ptr = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url), options: NSDataReadingUncached, error: error_ptr)

    presentError(error_ptr[0]) unless data

    data
  end

end
