class ImageSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :description, :image
  belongs_to :event
end
