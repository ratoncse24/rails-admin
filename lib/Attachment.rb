module Attachment



  #validate image attachment
  def validate_image
    if image.attached? == false
      errors.add(:image,"must have a image attached")
    elsif !image.content_type.in?("%w{image/jpeg,image/png,image/jpg}")
      errors.add(:image, "must be a jpeg or png")
    end


    #check is image avilable for view
    def isImage
     if self.image.attached? && self.image.content_type.in?("%w{image/jpeg,image/png,image/jpg}")
       return true
     else
       return false
     end
    end







  end










end