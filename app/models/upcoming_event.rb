class UpcomingEvent < ActiveRecord::Base
  has_many :pictures, as: :picturable

  accepts_nested_attributes_for :pictures
end
