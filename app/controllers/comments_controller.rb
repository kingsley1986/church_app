class CommentsController < ApplicationController

  before_action :find_comment_id, except: [:like, :create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end


  def destroy
    if @comment.user_id == current_user.id || current_user.admin?
      @comment.destroy
      respond_to do |format|
        format.json { render json: @post, location: @post }
      end
    else
      redirect_to :back
    end
  end

  def index
    @comment = Comment.all
  end

  def like
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: true)
    @comment.liker_id += [current_user.id]
    @comment.save
    redirect_to :back
  end


  def unlike
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: false)
    @comment.liker_id -= [current_user.id]
    @comment.save
    redirect_to :back
  end

  def find_comment_id
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, pictures_attributes: [:id, :comment_id, :image])
  end
end
