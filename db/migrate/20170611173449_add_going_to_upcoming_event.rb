class AddGoingToUpcomingEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :upcoming_events, :going, :jsonb, default: []
  end
end
