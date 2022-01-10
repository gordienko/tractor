class CreateMedias < ActiveRecord::Migration[7.0]
  def change
    create_table :medias do |t|
      t.string :name    

      t.timestamps
    end
  end
end
