class LikesController < ApplicationController
    def add_like
        @post =  Post.find(params[:id])
        current_user.likes.create(post: @post)
        redirect_to user_post_path(:user_id => current_user.id, :post_id => @post), notice: 'Liked successfully!'


    end

end
