class Client < ActiveRecord::Base
  before_create
  has_many :messages, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence:   true,
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
