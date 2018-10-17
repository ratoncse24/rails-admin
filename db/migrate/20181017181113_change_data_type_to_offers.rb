class ChangeDataTypeToOffers < ActiveRecord::Migration[5.2]
  def change
    change_column :offers, :offer_value, :numeric
    change_column :offers, :minimum_value, :numeric
    change_column :offers, :status, :numeric
    change_column :offers, :start_date, :date
    change_column :offers, :end_date, :date
  end
end
