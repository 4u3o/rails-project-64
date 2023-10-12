class Post::Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }
  has_ancestry
  belongs_to :post
  belongs_to :author, class_name: 'User'

  validates :content, presence: true

  scope :roots, -> { where(ancestry: '/') }
end
