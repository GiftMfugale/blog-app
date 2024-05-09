class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @current_user =  current_user
    @user_posts =  @user.posts

    authorize! :read, :post
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @current_user = current_user

    authorize! :read, @post
  end

  def new_post
    @post =  Post.new
    @user = current_user

    authorize! :create, @post
  end 
   
  def create_post

    @post = Post.new(post_params)

    authorize! :create, @post
    
    if @post.save

      redirect_to user_post_path(current_user, @post), notice: 'Post was created succesfully!'

    else
      render :new_post
    end
      
  
  end

  def edit_post
    @post = Post.find(params[:id])
    @user = current_user
    authorize! :update, @post
  end

  def update_post
    @post = Post.find(params[:id])

    authorize! :update, @post

    if @post.update(post_params)

      redirect_to user_post_path(current_user, @post), notice: "Post was updated successfully!"

    else 

      render :edit_post
    end
  end 


  def delete_post
    @post = Post.find(params[:id])

    authorize! :destroy, @post
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
