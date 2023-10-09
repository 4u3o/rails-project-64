class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :created_posts, class_name: 'Post', inverse_of: :creator
end
