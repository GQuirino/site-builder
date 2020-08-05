class CreateWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :widgets do |t|
      t.string :background_color
      t.string :title
      t.string :content
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
