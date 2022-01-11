class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.boolean :live, default: false
      t.string :keywords
      t.text :description

      t.timestamps
    end
    Site.create(name: "Website")
  end
end
