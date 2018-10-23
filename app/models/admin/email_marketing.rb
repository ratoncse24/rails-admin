class Admin::EmailMarketing < ApplicationRecord

  attr_accessor :send_type, :custom_email

  validates :sender_email ,  presence: true

end
