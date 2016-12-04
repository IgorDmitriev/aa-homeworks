class Book < ActiveRecord::Base
  validates :title, :author, presence: true, length: { minimum: 5 }
end
