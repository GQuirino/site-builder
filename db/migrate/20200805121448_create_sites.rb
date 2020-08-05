class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :icon
      t.string :background_color
      t.string :title

      t.timestamps
    end
  end
end
