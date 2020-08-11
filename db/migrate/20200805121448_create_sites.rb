class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :icon
      t.string :background_color
      t.string :title
      t.boolean :code_rendered, default: false

      t.timestamps
    end
  end
end
