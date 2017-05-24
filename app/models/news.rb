class News < ActiveRecord::Base

  has_many :pictures, as: :picturable
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }
end
