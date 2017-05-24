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
    @upcomings = UpcomingEvent.where("starting_date > ? ", Time.now)
  end

  def past_events
    @past_events = UpcomingEvent.where("end_date < ? ", Time.now)
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
    params.require(:upcoming_event).permit(:title, :body, :starting_date, :end_date, pictures_attributes: [:id, :upcoming_event_id, :image] )
  end
end
