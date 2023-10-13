class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  MIN_TITLE_LENGTH = 5
  MAX_TITLE_LENGTH = 255
  MIN_BODY_LENGTH = 200
  MAX_BODY_LENGTH = 4000

  belongs_to :creator, class_name: 'User'
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: {minimum: MIN_TITLE_LENGTH, maximum: MAX_TITLE_LENGTH}
  validates :body, length: {minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH}
end
