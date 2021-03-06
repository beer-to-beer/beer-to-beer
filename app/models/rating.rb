class Rating < ActiveRecord::Base
  has_many :criterions
  belongs_to :user
  belongs_to :beer
  accepts_nested_attributes_for :criterions
  validates :headline,:comment, presence: true
  validates_associated :criterions
end
