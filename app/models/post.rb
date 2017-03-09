class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  
end
