# frozen_string_literal: true

module Posts
  module CommentsHelper
    def link_to_comment(comment)
      link_to I18n.t('.answer'), '#',
              class: 'fs-6 text-decoration-underline text-lowercase',
              role: 'button',
              'aria_controls' => "response_comment-#{comment.id}",
              'aria-expanded' => 'false',
              'data-bs-target' => "#response_comment-#{comment.id}",
              'data-bs-toggle' => 'collapse'
    end
  end
end
