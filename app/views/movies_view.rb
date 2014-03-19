class MoviesView < UIScrollView
  attr_accessor :movies

  def init
    super.tap do |ov|
      @last_view = nil

      @movies.each_with_index do |movie, index|

        @last_view = UIView.alloc.init.tap do |v|
          v.frame = [[0,0], [320, 100]]
          v.addSubview(
            Detail::MovieTitleView.initWithMovie(movie).tap do |l|
            end
          )
          v.addSubview(
            Detail::IMDBRatingView.initWithMovie(movie).tap do |l|
            end
          )
          v.addSubview(
            Detail::MovieImageView.initWithMovie(movie).tap do |l|
            end
          )
        end

      end
    end

    self.contentSize = CGSizeMake(320, 1000)
  end
end
