class RepliesController < ApplicationController

   def create
      @comment = Comment.find(params[:comment_id])
     @reply = @comment.replies.create(params[:reply].permit(:reply_body))
     @reply.user = current_user
     if @reply.save
       redirect_back fallback_location: root_path
     else
       redirect_back fallback_location: root_path
     end
   end

   def index
     @comments = Comment.find(params[:comment_id])
     @replies = @comments.replies
   end

   def destroy
     @reply = Reply.find(params[:id])
     if @reply.user_id == current_user.id || current_user.admin?
       @reply.delete
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path
    end
  end
end
