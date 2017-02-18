class Comment < ApplicationRecord

  belongs_to :post
  # has_many :comments, dependent: :destroy

  validates :body, presence: true, uniqueness: true
end
