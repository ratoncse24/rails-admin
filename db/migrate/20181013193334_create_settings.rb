class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|

      t.string :company_name
      t.string :company_title
      t.string :company_phone
      t.string :company_email
      t.text :company_address
      t.text :company_location
      t.text :company_about
      t.string :company_facebook
      t.string :company_twitter
      t.string :comapny_youtube
      t.string :company_other
      t.timestamps
    end
  end
end
