class PostValidator < SimpleDelegator
  include ActiveModel::Validations

  validates :title, presence: true
  validates :body, presence: true
end
