class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image_id, :content
  belongs_to :user
  belongs_to :image
end
