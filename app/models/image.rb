class Image < ApplicationRecord
  belongs_to :event
  has_many :comments
  has_many :image_tags
  has_many :tags, through: :image_tags
end
