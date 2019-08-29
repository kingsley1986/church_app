class UpcomingEvent < ApplicationRecord
  has_many :pictures, as: :picturable, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :comments
end
