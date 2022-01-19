# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string
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
  validates :title, presence: true
  validates :template, presence: true
  has_rich_text :content
  acts_as_list


  def self.templates
    ['Standard', 'Contact', 'History' ]
  end
end
