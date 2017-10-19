class Api::V1::RatingsController < Api::V1::BaseController
  before_action :set_post, only: [:create]

  def create
    rate_post_service = RatePostService.new(@post, params[:mark])
    if rate_post_service.perform
      render json: rate_post_service.average_ratio
    else
      error_response(rate_post_service.errors)
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

end
