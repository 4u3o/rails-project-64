class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :body, presence: true
end
