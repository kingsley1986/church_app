class Page < ApplicationRecord
  has_many :pictures, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :pictures , allow_destroy: true, :reject_if => proc { |attributes| attributes['image'].blank? }


  PAGE_TYPE = [  'Childrens',
                 'Youths',
                 'Women',
                 'Food',
                 'Community',
                 'Hospital',
                 'Sunday',
                 'Tuesday',
                 'Thursday',
                 'Home Page',
                 'Contact',
                 'About_Redeedemed',
                 'About_Go',
                 'About_Parish_pastor',
                 'About',
                 'Fridaynightvigil',
                 'Lunchhourprayer',
               ]


scope :children, -> { where(page_type: 'Childrens')  }
scope :youth, -> { where(page_type: 'Youths') }
scope :elder, -> { where(page_type:  'Elders')  }
scope :food, -> { where(page_type: 'Food') }
scope :community, -> { where(page_type: 'Community') }
scope :hospital, -> { where(page_type: 'Hospital') }
scope :sunday, -> { where(page_type: 'Sunday') }
scope :tuesday, -> { where(page_type: 'Tuesday') }
scope :thursday, -> { where(page_type:  'Thursday')  }
scope :home, -> { where(page_type:  'Home Page')  }
scope :contact, -> { where(page_type: 'Contact') }
scope :about, -> { where(page_type: 'About') }
scope :about_redeedemed, -> { where(page_type: 'About_Redeedemed') }
scope :about_parish_pastor, -> { where(page_type: 'About_Parish_pastor') }
scope :fridaynightvigil, -> { where(page_type: 'Fridaynightvigil') }
scope :lunchhourprayer, -> { where(page_type: 'Lunchhourprayer') }
scope :generalnightvigil, -> { where(page_type: 'Generalnightvigil') }
scope :women, -> { where(page_type: 'Women') }

end
