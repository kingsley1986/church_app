class  UpcomingEventsController < ApplicationController

  def new
    @upcoming_events =  UpcomingEvent.new
  end

  def create
    @upcoming_event = UpcomingEvent.create(upcoming_events_params)
    if @upcoming_event.save
      redirect_to upcoming_events_path
    end
  end

  def index
    @upcoming_events = UpcomingEvent.all
  end

  def upcomings
    @ue = UpcomingEvent.all
    @upcomings = @ue.select { |a| a.starting_date.strftime('%Y-%m-%d %H:%M:%S') > DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}
  end

  def past_events
    @pe = UpcomingEvent.all
    @past_events = @pe.select { |a| a.end_date.strftime('%Y-%m-%d %H:%M:%S') < DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}
  end

  def goingpeople
    @going_event = UpcomingEvent.find(params[:id])
    @going_event.going += [1]
    respond_to do |format|
      if @going_event.save
        format.json { render json: @going_event}
      end
    end
  end

  def coming_with_person
    @going_event = UpcomingEvent.find(params[:id])
    @going_event.coming_with += [1]
    if @going_event.save
      flash[:notice] = "Thank you for coming and bringing someone with you"
      redirect_to :back
    end
  end

  def live_events
    @lives =  UpcomingEvent.all
    #    start = u.starting_date.to_datetime
    #  finish = u.end_date.to_datetime
    #  while(start < finish) do
    #    start += 1.minute
    #    if Time.now.to_s >= u.starting_date.to_s &&  start <= u.end_date
    #      @live_events = start
    #      return @live_events
    #    end
    #  end
    # end
  end




  def upcoming_events_params
    params.require(:upcoming_event).permit(:title, :going, :body, :starting_date, :end_date, coming_with: [], pictures_attributes: [:id, :upcoming_event_id, :image] )
  end
end
