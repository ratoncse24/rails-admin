class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :short_description
      t.string :long_description
      t.numeric :status

      t.timestamps
    end
  end
end
