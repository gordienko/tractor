# == Schema Information
#
# Table name: menuitems
#
#  id                :integer          not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  ancestry          :string
#  ancestry_depth    :integer          default("0")
#  children_count    :integer          default("0")
#  menu_id           :integer
#  position          :integer
#  menuitemable_id   :integer
#  menuitemable_type :text
#
# Indexes
#
#  index_menuitems_on_ancestry                               (ancestry)
#  index_menuitems_on_menu_id                                (menu_id)
#  index_menuitems_on_menuitemable_type_and_menuitemable_id  (menuitemable_type,menuitemable_id)
#

class Menuitem < ApplicationRecord
  validates :name, presence: true
  acts_as_list scope: [:ancestry]
  has_ancestry cache_depth: true, counter_cache: true
  belongs_to :menu
  belongs_to :menuitemable, polymorphic: true, optional: true
end
