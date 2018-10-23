class Admin::Offer < ApplicationRecord

  require 'securerandom'

  # attr_accessor :offer_code

  before_validation(:on => :create) do
    self.offer_code = SecureRandom.hex(6)
  end

  validates :offer_name, :offer_value, :minimum_value, :start_date, :end_date, :status , presence: true
  validates :offer_value, numericality: true

end
