class Beer < ActiveRecord::Base
  belongs_to :category
  belongs_to :producer
  has_many :shop_beers
  has_many :shops, through: :shop_beers
  has_many :ratings
  has_many :users, :through => :ratings
  accepts_nested_attributes_for :category, :producer
  validates :title, :category_id, :producer_id, presence: true
end