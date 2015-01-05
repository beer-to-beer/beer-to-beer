class User < ActiveRecord::Base
  rolify
  belongs_to :address
  has_many :ratings
  has_many :beers, :through => :ratings

  accepts_nested_attributes_for :address




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
