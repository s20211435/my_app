class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendees
  has_many :attendees, through: :event_attendees, source: :user
  has_many :comments, as: :commentable
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
