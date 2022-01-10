class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.string :keywords
      t.string :slug
      t.integer :position
      t.integer :parent_id
      t.string :template

      t.timestamps
    end
  end
end
