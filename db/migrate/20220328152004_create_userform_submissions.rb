class CreateUserformSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :userform_submissions do |t|
      
      t.timestamps
    end
  end
end
