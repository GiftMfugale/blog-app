class CommentsController < ApplicationController
    def create_comment
        @post = Post.find(params[:id])
        @comment = @post.comments.build(comment_params)

        authorize! :create, @comment
        if @comment.save
            redirect_to user_post_path(current_user, @post), notice: 'Comment was saved successfully!'
        else
        
            render :create_comment
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :user_id)
    end
        


end 