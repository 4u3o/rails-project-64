class Post::Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
