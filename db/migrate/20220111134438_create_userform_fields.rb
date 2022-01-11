class CreateUserformFields < ActiveRecord::Migration[7.0]
  def change
    create_table :userform_fields do |t|
      t.string :field_type
      t.string :name
      t.string :hint
      t.string :default
      t.string :placeholder
      t.timestamps
    end
    add_reference :userform_fields, :userform, foreign_key: true
  end
end
