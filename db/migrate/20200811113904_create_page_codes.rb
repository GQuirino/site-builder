class CreatePageCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :page_codes do |t|
      t.text :html
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
