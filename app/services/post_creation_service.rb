class PostCreationService

  attr_reader :errors, :post

  def initialize(params = {})
    @params = params.with_indifferent_access
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

  # def initialize(post = nil)
  #   @post = post
  # end

  # def perform
  #   validator = PostValidator.new(post)
  #   if validator.valid?
  #     post.user = User.find_or_create_by!(login: @params[:login])
  #     post.save!(validate: false)
  #   else
  #     validator.errors.full_messages
  #   end
  # end

# private

#   def perform
#     ActiveRecord::Base.transaction do
#       user = User.find_or_create_by!(login: params[:login])
#       post = Post.create!(user: user, title: params[:title], body: params[:body], ip: params[:ip])
#     end
#   end

end
