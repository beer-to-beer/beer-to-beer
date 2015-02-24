class Shop < ActiveRecord::Base

  has_many :shop_beers
  has_many :beers, through: :shop_beers
  belongs_to :user
  belongs_to :address
  validates :name,:email,:phonenumber,:website, presence: true
  validates_associated :address
  accepts_nested_attributes_for :address, :user
end