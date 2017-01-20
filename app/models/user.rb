class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  # has_many :users, :through => :friendships, :foreign_key => "friend_id"
  # friended by users (who user was friended by):
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :events
  has_many :images, through: :events
  has_many :comments, through: :images

  has_secure_password
end
