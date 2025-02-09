class User < ApplicationRecord
  has_many :events
  has_many :tasks
  validates :name, presence: true
end
