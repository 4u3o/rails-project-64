# frozen_string_literal: true

module Posts
  class ApplicationController < ApplicationController
    before_action :authenticate_user!
    before_action :post

    private

    def post
      @post ||= Post.find(params[:post_id])
    end
  end
end
