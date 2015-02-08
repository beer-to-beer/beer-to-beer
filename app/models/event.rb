class Event < ActiveRecord::Base
  belongs_to :club
  mount_uploader :imageURL, ImageUploader
  accepts_nested_attributes_for :club
  #validates :club_id, :title, presence: true

  before_destroy :remember_image
  after_destroy :remove_img

  protected
  def remember_image
    @image_name = self[:imageURL]
  end

  def remove_img
    if @image_name.present?
      if File.exist?(@image_name)
        File.delete(@image_name)
      end
    end
  end

end
