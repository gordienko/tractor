class AddParentIdToMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menuitems do |t|
      t.string :name

      t.timestamps
    end
    add_column  :menuitems, :ancestry, :string
    add_index   :menuitems, :ancestry
    add_column  :menuitems, :ancestry_depth, :integer, :default => 0
    add_column  :menuitems, :children_count, :integer, :default => 0
  end
end
