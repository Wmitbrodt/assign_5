class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  before_save :downcase_email

  before_create :generate_api_key

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
  uniqueness: true,
  format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

    private

    def generate_api_key
      loop do
        self.api_key = SecureRandom.hex
        break unless User.exists?(api_key: api_key)
      end
    end

    def downcase_email
      self.email&.downcase!
    end


end
