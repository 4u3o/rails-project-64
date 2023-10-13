class Post::Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }

  MIN_CONTENT_LENGTH = 5

  has_ancestry

  belongs_to :post
  belongs_to :author, class_name: 'User'

  validates :content, presence: true,
                      length: {minimum: MIN_CONTENT_LENGTH}

  scope :roots, -> { where(ancestry: '/') }
end
