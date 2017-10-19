class Api::V1::PostsController < Api::V1::BaseController

  def create
    post_creation_service = PostCreationService.new(post_params)
    if post_creation_service.perform
      render json: post_creation_service.post
    else
      error_response(post_creation_service.errors)
    end
  end

  def top_rated
    limit = params[:limit] || 20
    posts = Post.top_rated.limit(limit)
    render json: posts
  end

  def ip_list
    ip_list_service = IpListService.new()
    ip_list_service.perform
    render json: ip_list_service.results
  end

  private

  def post_params
    params.permit(:login, :ip, :title, :body)
  end

end
