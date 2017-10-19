class RatePostService

  attr_reader :average_ratio, :errors

  def initialize(post, mark)
    @post = post
    @mark = mark
  end

  def perform
    rating = Rating.new(post: @post, mark: @mark)
    validator = RatingValidator.new(rating)
    if validator.valid?
      @post.with_lock do
        rating.save!(validate: false)
        calculate_average_ratio
        @post.update_attribute(:average_ratio, @average_ratio)
      end
      true
    else
      @errors = validator.errors.full_messages
      false
    end
  end

  def calculate_average_ratio
    ratings = Rating.where(post_id: @post.id)
    @average_ratio = (ratings.sum(&:mark).to_f / ratings.size).round(2)
  end
end
