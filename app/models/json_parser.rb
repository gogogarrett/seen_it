class JSONParser
  include PresentError

  def self.parse_from_url(url)
    data = DataParser.parse(url)
    error_ptr = Pointer.new(:object)
    json = NSJSONSerialization.JSONObjectWithData(data, options: 0, error: error_ptr)
    presentError(error_ptr[0]) unless json

    json
  end
end
