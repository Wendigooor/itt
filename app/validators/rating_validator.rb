class RatingValidator < SimpleDelegator
  include ActiveModel::Validations

  validates :mark, presence: true
  validates :mark, numericality: { greater_than: 0 }
  validates :post, presence: true
end
