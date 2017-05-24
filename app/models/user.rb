class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable


  has_many :pictures
  has_many :posts
  has_many :comments
  has_many :replies, through: :comment
end
