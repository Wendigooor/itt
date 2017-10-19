class PostCreationService

  attr_reader :errors, :post

  def initialize(params = {})
    @params = params
  end

  def perform
    @post = Post.new(title: @params[:title], body: @params[:body], ip: @params[:ip])
    validator = PostValidator.new(@post)
    if validator.valid?
      @post.user = User.find_or_create_by!(login: @params[:login])
      @post.save!(validate: false)
    else
      @errors = validator.errors.full_messages
      false
    end
  end

end
