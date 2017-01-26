class Event < ApplicationRecord
  belongs_to :user
  has_many :images, :dependent => :destroy

  validates_presence_of :title
end
