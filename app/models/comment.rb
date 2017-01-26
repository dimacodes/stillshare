class Comment < ApplicationRecord
  belongs_to :image

  validates_presence_of :content
end
