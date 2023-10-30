# frozen_string_literal: true

class PostComment < ApplicationRecord
  MIN_CONTENT_LENGTH = 5
  MAX_CONTENT_LENGTH = 400

  has_ancestry

  belongs_to :post
  belongs_to :user

  validates :content, presence: true,
                      length: { minimum: MIN_CONTENT_LENGTH, maximum: MAX_CONTENT_LENGTH }
end
