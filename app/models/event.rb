class Event < ActiveRecord::Base
  belongs_to :club
  mount_uploader :imageURL, ImageUploader
end
