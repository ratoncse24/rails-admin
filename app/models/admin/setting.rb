class Admin::Setting < ApplicationRecord
  has_one_attached :logo
  has_one_attached :fevicon

  def logo_thumbnail
    self.logo.variant(resize: '100x100!').processed
  end

  def fevicon_thumbnail
    self.fevicon.variant(resize: '100x100!').processed
  end

end
