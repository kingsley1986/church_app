class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :email, presence: true
         validates :password, presence: true
         validates :password_confirmation, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :phone, presence: true
         validates :gender, presence: true

         has_many :posts
         has_many :comments
         has_many :replies
         has_many :pictures

    # before_validation :params_sanitizer, only: :update

  # def params_sanitizer
  #   if self[:roles].include?("")
  #     self.roles.delete("")
  #   end
  # end

  def self.roles
    ['pastor', 'assistant pastor']
  end
end
