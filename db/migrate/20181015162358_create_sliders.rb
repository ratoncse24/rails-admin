class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :description
      t.numeric :status
      t.timestamps
    end
  end
end
