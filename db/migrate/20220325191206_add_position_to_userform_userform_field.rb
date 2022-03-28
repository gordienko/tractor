class AddPositionToUserformUserformField < ActiveRecord::Migration[7.0]
  def change
    add_column :userform_fields, :position, :integer
  end
end
