class Comment < ApplicationRecord
    # belongs_to :picturable, polymorphic: true
  belongs_to :post
  belongs_to :user
  validates :body, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :upcoming_event
  has_many :pictures, as: :picturable, dependent: :destroy
  has_many :replies, dependent: :destroy


  validates :body, presence: true


  accepts_nested_attributes_for :pictures

  before_validation :params_sanitizer, only: :update

  def params_sanitizer
    if self[:approved].include?("")
      self.approved.delete("")
    end
  end

  def self.approver
    ['rejected', 'decisioning', 'approved']
  end

end
