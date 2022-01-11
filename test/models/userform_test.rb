# == Schema Information
#
# Table name: userforms
#
#  id                 :integer          not null, primary key
#  name               :string
#  user_notification  :text
#  admin_notification :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require "test_helper"

class UserformTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
