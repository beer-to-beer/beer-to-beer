class User < ActiveRecord::Base
  rolify
  belongs_to :address
  has_many :ratings
  has_many :beers, :through => :ratings
  has_many :clubs

  accepts_nested_attributes_for :address

  validates :first_name,:last_name, presence: true
  validates_associated :address


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
