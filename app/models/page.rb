class Page < ActiveRecord::Base
  has_many :pictures, as: :picturable
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }


  PAGE_TYPE = [  'Childrens',
                 'Youths',
                 'Elders',
                 'Food',
                 'Prison',
                 'Hospital',
                 'Sunday',
                 'Tuesday',
                 'Thursday',
                 'Father',
                 'Son',
                 'Holy Spirit',
                 'Home Page',
                 'Contact'
               ]


scope :children, -> { where(page_type: 'Childrens')  }
scope :youth, -> { where(page_type: 'Youths') }
scope :elder, -> { where(page_type:  'Elders')  }
scope :food, -> { where(page_type: 'Food') }
scope :prison, -> { where(page_type: 'Prisonns') }
scope :hospital, -> { where(page_type: 'Hospital') }
scope :sunday, -> { where(page_type: 'Sunday') }
scope :tuesday, -> { where(page_type: 'Tuesday') }
scope :thursday, -> { where(page_type:  'Thursday')  }
scope :father, -> { where(page_type: 'Father') }
scope :son, -> { where(page_type:  'Son')  }
scope :home, -> { where(page_type:  'Home Page')  }
scope :holy_spirit, -> { where(page_type: 'Holy Spirit') }
scope :home, -> { where(page_type: 'Home Page') }
scope :contact, -> { where(page_type: 'Contact') }

end
