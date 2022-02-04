class Clevermenuitem < ActiveRecord::Migration[7.0]
  def change
    add_column :menuitems, :menuitemable_id, :integer
    add_column :menuitems, :menuitemable_type, :string
    add_index :menuitems, [:menuitemable_type, :menuitemable_id]
  end
end
