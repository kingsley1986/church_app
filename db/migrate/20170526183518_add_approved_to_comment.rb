class AddApprovedToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :approved, :jsonb, default: []
  end
end
