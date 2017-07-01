class Sermon < ActiveRecord::Base
  has_many :pictures, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }


  Sermon.all.each do |sermon|
    sermon.pictures.each do |pic|
      pic.image.recreate_versions!
    end
  end

  self.per_page = 10
  
  WillPaginate.per_page = 10

end
