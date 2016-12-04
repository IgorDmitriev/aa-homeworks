class Person < ApplicationRecord
  validates :name, presence: true
  validates :house_id, presence: true

  belongs_to :house
end
