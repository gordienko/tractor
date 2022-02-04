class AddMenuToMenuitems < ActiveRecord::Migration[7.0]
  def change
    add_reference :menuitems, :menu, foreign_key: true

  end
end
