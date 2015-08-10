class Favorite < ActiveRecord::Base
  belongs_to :favorited, polymorphic: true # AWESOME use of polymorphic, true!!!
  belongs_to :user
end
