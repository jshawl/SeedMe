class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :email, presence: true

  has_many :companies, dependent: :destroy

  has_secure_password
end
