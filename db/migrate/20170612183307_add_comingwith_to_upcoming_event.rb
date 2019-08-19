class AddComingwithToUpcomingEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :upcoming_events, :coming_with, :jsonb, default: []
  end
end
