class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category

  validates :title, :body, presence: true
end
