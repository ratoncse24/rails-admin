class CreateEmailMarketings < ActiveRecord::Migration[5.2]
  def change
    create_table :email_marketings do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :reciver_email
      t.string :email_subject
      t.text :email_body

      t.timestamps
    end
  end
end
