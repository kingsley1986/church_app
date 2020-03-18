class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # before_action :find_comment_id, except: [:like, :create]
    before_action :set_commenter, only: [:create]


  def create
    @comment =  @person.comments.create(comment_params)
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end


  def destroy
    # if @comment.user_id == current_user.id || current_user.admin?
    if current_user.admin?
      comment = Comment.find(params[:id])
      comment.destroy
      respond_to do |format|
        format.html { redirect_to @post.comments }
        format.js
      end
    else
      redirect_back fallback_location: root_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    if @comment.save
      redirect_back fallback_location: root_path
    end
  end

  def index
    @all_comments =  @person.comments
  end

  def like
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: true)
    @comment.liker_id += [current_user.id]
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      end
    end
  end


  def unlike
    @comment = Comment.find(params[:id])
    @comment.update_attributes(like: false)
    @comment.liker_id -= [current_user.id]
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      end
    end
  end

  def find_comment_id
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :name, :approved, pictures_attributes: [:id, :comment_id, :image])
  end

  def set_commenter
    klass = [Post, UpcomingEvent].detect{|c| params["#{c.name.underscore}_id"]}
    @person = klass.find(params["#{klass.name.underscore}_id"])
  end
end
