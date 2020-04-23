class LikesController < ApplicationController
  def update
    @post = Post.find(params[:id])
    @like = @current_user.likes.build(post_id: params[:id])
    @like.save
    # redirect_back(fallback_location: posts_url)
  end
  def destroy
    @post = Post.find(params[:id])
    @like = Like.find_by(
      post_id: params[:id],
      user_id: @current_user.id)
    @like.destroy
    # redirect_back(fallback_location: posts_url)
  end
end
