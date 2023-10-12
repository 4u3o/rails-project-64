class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :created_posts, class_name: 'Post', foreign_key: :creator_id,
                           inverse_of: :creator, dependent: :destroy
  has_many :comments, class_name: 'Post::Comment', foreign_key: :author_id,
                      inverse_of: :author, dependent: :destroy
  has_many :likes, class_name: 'Post::Like', inverse_of: :user, dependent: :destroy

  def liked_post?(post)
    likes.find_by(post_id: post.id).present?
  end
end
