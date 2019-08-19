class AddReviewApprovedToSermonreview < ActiveRecord::Migration[5.2]
  def change
    add_column :sermonreviews, :review_approve, :jsonb, default: []
  end
end
