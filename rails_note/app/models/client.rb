class Client < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  has_many :documents, dependent: :destroy
end
