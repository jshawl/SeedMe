class Company < ActiveRecord::Base
  belongs_to :user
  acts_as_votable #nice!
end
