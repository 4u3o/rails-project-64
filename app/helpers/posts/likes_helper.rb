module Posts::LikesHelper
  def like_tag(post)
    return content_tag :i, '', class: "bi bi-hand-thumbs-up" unless user_signed_in?

    if current_user.liked_post?(post)
      link_to post_like_path(post, current_user.likes.find_by(post: post)), data: {turbo_method: :delete} do
        content_tag :i, '', class: "bi bi-hand-thumbs-up-fill"
      end
    else
      link_to post_likes_path(post), data: {turbo_method: :post} do
        content_tag :i, '', class: "bi bi-hand-thumbs-up"
      end
    end
  end
end
