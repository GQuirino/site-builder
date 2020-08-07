class AddUniqueWidgetPositionToSite < ActiveRecord::Migration[6.0]
  def change
    add_index :widgets, [:position, :site_id], unique: true
  end
end
