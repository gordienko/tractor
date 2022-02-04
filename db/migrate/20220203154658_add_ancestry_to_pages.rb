class AddAncestryToPages < ActiveRecord::Migration[7.0]
  def change
    
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry
    add_column :pages, :ancestry_depth, :integer, :default => 0
    add_column :pages, :children_count, :integer, :default => 0
  end
end
