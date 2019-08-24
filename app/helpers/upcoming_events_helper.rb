module UpcomingEventsHelper

  def upcomings
    @ue = UpcomingEvent.all.select { |a| a.starting_date.strftime('%Y-%m-%d %H:%M:%S') > DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}
    @up_coming = Kaminari.paginate_array(@ue).page(params[:page]).per(4)
    return @up_coming
  end
end
