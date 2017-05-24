class Post < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, as: :picturable
  has_many :comments
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }

end
