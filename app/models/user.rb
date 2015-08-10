class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
  has_many :companies, dependent: :destroy

  has_many :favorites
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id"
  has_many :favorite_companies, through: :favorites, source: :favorited, source_type: 'Company'
  has_secure_password
  # Excellent use of the custom has_many's here.
  # How does this differ from defining instance methods? e.g.:
  # def received_messages
  #   Message.where(receiver: current_user)
  # end
end
