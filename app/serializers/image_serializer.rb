class ImageSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :title, :date, :description, :image
  belongs_to :event
  has_many :comments
  has_many :tags
end
