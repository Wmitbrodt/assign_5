class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
  uniqueness: true,
  format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

    private

    def downcase_email
      self.email&.downcase!
    end


end
