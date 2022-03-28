class UserformFieldsSubmissions < ActiveRecord::Migration[7.0]
  def change
     add_reference :userform_submissions, :userform, foreign_key: true
  end
end
