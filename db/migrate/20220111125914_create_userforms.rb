class CreateUserforms < ActiveRecord::Migration[7.0]
  def change
    create_table :userforms do |t|
      t.string :name
      t.text :user_notification
      t.text :admin_notification

      t.timestamps
    end
  end
end
