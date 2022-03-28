class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.bigint  :fieldable_id
      t.string  :fieldable_type
      t.string :ancestry
      t.timestamps
    end
    add_index :fields, :ancestry
  end
end
