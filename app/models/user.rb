class User < ActiveRecord::Base
  rolify
  belongs_to :address


  accepts_nested_attributes_for :address




  #attr_accessible :email, :password, :password_confirmation,:first_name,:last_name, :remember_me, :address_attributes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
