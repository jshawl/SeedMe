class Message < ActiveRecord::Base
  belongs_to :user, :class_name => "sender"
  belongs_to :user, :class_name => "receiver"
end
