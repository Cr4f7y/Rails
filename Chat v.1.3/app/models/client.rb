class Client < ActiveRecord::Base

  has_many :messages, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :login, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true

  validates :password, length: { minimum: 6 }

end
