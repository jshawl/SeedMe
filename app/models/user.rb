class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  has_many :companies, dependent: :destroy

  has_secure_password
end
