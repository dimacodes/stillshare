class ImageTagSerializer < ActiveModel::Serializer
  attributes :image_id, :tag_id
  belongs_to :image
  belongs_to :tag
end
