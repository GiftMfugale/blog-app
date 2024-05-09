class Api::V1::PostsController < ApplicationController
  def index
    @user=  User.find(params[:user_id])
    @posts =  @user.posts
    render json: @posts
  end

  private 

def user_param
end

end


