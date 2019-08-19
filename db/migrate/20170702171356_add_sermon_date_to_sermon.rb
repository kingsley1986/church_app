class AddSermonDateToSermon < ActiveRecord::Migration[5.2]
  def change
    add_column :sermons, :sermondate, :date
  end
end
