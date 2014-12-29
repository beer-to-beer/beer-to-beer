class Producer < ActiveRecord::Base
  belongs_to :address
  has_many :beers
  validates :name, :address_id, presence: :true
  accepts_nested_attributes_for :address
end
