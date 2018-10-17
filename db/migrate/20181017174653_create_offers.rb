class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :offer_name
      t.string :offer_code
      t.string :offer_value
      t.string :minimum_value
      t.string :status
      t.string :start_date
      t.string :end_date
      t.belongs_to :customer

      t.timestamps
    end
  end
end
