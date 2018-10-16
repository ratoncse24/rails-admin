class Category < ApplicationRecord

  #upload category image
  has_one_attached :image

  #define validations
  validates :name, :status , presence:true


  #relation with products table one to many
  has_many :products, dependent: :destroy



  # category image resize
  def preview

    self.image.variant(resize: '40x40!').processed
  end

  def thumbnail
    self.image.variant(resize: '100x100!').processed
  end



end
