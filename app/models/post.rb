class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings

  scope :top_rated, -> { where.not(average_ratio: nil).order(average_ratio: :desc) }
end
