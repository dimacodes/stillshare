class Event < ApplicationRecord
  belongs_to :user
  has_many :images, :dependent => :destroy

  # has_many :event_contributors
  # has_many :contributors, through: :event_contributors, source: "user"

  validates_presence_of :title
end
