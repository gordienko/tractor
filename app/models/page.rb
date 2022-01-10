# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  tile        :string
#  description :text
#  keywords    :string
#  slug        :string
#  position    :integer
#  parent_id   :integer
#  template    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ApplicationRecord
end
