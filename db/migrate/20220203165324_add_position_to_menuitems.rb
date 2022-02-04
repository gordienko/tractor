class AddPositionToMenuitems < ActiveRecord::Migration[7.0]
  def change
    add_column :menuitems, :position, :integer
  end
end
