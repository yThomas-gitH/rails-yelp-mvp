class Review < ApplicationRecord
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
  validates :rating, numericality: { only_integer: true }
  belongs_to :restaurant
end
