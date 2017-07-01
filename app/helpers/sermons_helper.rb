module SermonsHelper

  def set_sermons
    @sermons = Sermon.all.order('created_at DESC').paginate(page: params[:page], per_page:  3)
  end
end
