require 'Attachment'
class Admin::Banner < ApplicationRecord
  include Attachment
  # accept banner image
  has_one_attached :image

  # velidate image only
  validate :validate_image

end
