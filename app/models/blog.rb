require 'Attachment'

class Blog < ApplicationRecord

  include Attachment

  has_one_attached :image

  # validate image file
  validate :validate_image



end
