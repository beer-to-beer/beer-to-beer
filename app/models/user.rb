class User < ActiveRecord::Base
  rolify
  belongs_to :address
  has_many :ratings
  has_many :beers, :through => :ratings
  has_many :clubs
  has_many :shops
  accepts_nested_attributes_for :address

  validates :first_name,:last_name, presence: true
  validates_associated :address


  after_create :assign_default_role

  def assign_default_role
    add_role(:user)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
