class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true
end
