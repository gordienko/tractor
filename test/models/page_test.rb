# == Schema Information
#
# Table name: pages
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  keywords       :string
#  slug           :string
#  position       :integer
#  parent_id      :integer
#  template       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ancestry       :string
#  ancestry_depth :integer          default("0")
#  children_count :integer          default("0")
#
# Indexes
#
#  index_pages_on_ancestry  (ancestry)
#  index_pages_on_slug      (slug) UNIQUE
#

require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
