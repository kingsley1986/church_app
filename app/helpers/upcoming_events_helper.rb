module UpcomingEventsHelper

  def upcomings
    @ue = UpcomingEvent.paginate(page: params[:page], per_page:  4).all.order('created_at DESC')
    upcomings = @ue.select { |a| a.starting_date.strftime('%Y-%m-%d %H:%M:%S') > DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}
      return upcomings
  end

end
