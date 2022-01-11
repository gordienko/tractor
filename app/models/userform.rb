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

class Userform < ApplicationRecord
  validates :name, presence: true
  has_many :userform_fields
end
