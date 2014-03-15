module Detail
  class MovieImageView < UIView

    def self.initWithMovie(movie)
      DetailStylesheet.movie_image.tap do |l|
        l.frame = [[20, 65], [280, 320]]
        l.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(movie.poster)))
      end
    end
  end
end
