class Api::V1::PostsController < Api::V1::BaseController

  def create
    post_creation_service = PostCreationService.new(post_params)
    if post_creation_service.perform
      render json: post_creation_service.post
    else
      error_response(post_creation_service.errors)
    end
  end

  private

  def post_params
    params.permit(:login, :ip, :title, :body)
  end

end
