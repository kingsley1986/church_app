class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user
  validates :body, presence: true
  has_many :pictures, as: :picturable
  has_many :replies
  accepts_nested_attributes_for :pictures

end
