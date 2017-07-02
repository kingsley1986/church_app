class SermonreviewsController < ApplicationController

  def new
    @sermon_comments = Sermonreview.new
  end

  def create
    @sermon = Sermon.find(params[:sermon_id])
    @sermon_comment = @sermon.sermonreviews.create(sermon_comments_params)
    if @sermon_comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def index
    @sermon_comments =  Sermonreview.all
  end

  def show
    @sermon_comment =  Sermonreview.find(params[:id])
  end


  private

  def sermon_comments_params
    params.require(:sermonreview).permit(:body, :name, :email)
  end
end
