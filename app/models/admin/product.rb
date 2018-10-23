class Admin::Product < ApplicationRecord
  require 'securerandom'
  attr_accessor :name
  #upload single image
 # has_one_attached :item_images
  #upload multiple image
  has_many_attached :item_images

  validate :correct_image_type
  #realtion with category table many to one
  belongs_to :category

  before_validation(:on => :create) do
    self.item_code = SecureRandom.hex(6)
  end



  #resize image
  def small input
    return self.item_images[input].variant(resize: '80x80!').processed
  end

  def thumbnail input
    return self.item_images[input].variant(resize: '300x300!').processed
  end

  def banner
    return self.item_images.variant(resize: '900x200!').processed
  end


  private

  def correct_image_type
   if item_images.attached? == false
      errors.add(:item_images, "must have a image attached")
     elsif  item_images.each do |img|
         if !img.content_type.in?(%{image/jpeg image/png})
         errors.add(:item_images, "must be a jpeg or png")
         end
      end
    end
  end


  end