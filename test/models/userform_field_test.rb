# == Schema Information
#
# Table name: userform_fields
#
#  id          :integer          not null, primary key
#  field_type  :string
#  name        :string
#  hint        :string
#  default     :string
#  placeholder :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  userform_id :integer
#
# Indexes
#
#  index_userform_fields_on_userform_id  (userform_id)
#

require "test_helper"

class UserformFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
