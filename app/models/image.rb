class Image < ApplicationRecord
  belongs_to :event
  has_many :comments, :dependent => :destroy
  has_many :image_tags
  has_many :tags, through: :image_tags

  validates_presence_of :title, :date, :image

  mount_uploader :image, ImageUploader

  def self.most_commented
		Image.all.max_by do |image|
			image.comments.count
    end
  end
end
