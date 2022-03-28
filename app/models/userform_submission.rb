# == Schema Information
#
# Table name: userform_submissions
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  userform_id :integer
#
# Indexes
#
#  index_userform_submissions_on_userform_id  (userform_id)
#

class UserformSubmission < ApplicationRecord
  belongs_to :userform
end
