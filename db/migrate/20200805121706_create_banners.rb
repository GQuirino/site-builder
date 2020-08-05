class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.string :background_color
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
