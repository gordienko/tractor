class AddCustomFieldsToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :custom_content, :jsonb, :null => false, :default => {}
  end
end
