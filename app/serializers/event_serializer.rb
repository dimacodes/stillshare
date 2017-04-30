class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :descritption
  belongs_to :user
  has_many :images
end
