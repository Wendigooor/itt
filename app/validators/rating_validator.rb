class RatingValidator < SimpleDelegator
  include ActiveModel::Validations

  validates :mark, presence: true
  validates :post, presence: true
end
