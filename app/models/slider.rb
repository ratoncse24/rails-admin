require 'Attachment'

class Slider < ApplicationRecord
  include Attachment
  # upload slider image
  has_one_attached :image

  validate :validate_image



end
