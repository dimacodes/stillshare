class Comment < ApplicationRecord
  belongs_to :image
  belongs_to :user

  validates_presence_of :content
end
