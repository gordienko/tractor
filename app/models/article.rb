# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  intro      :text
#  published  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
    validates :title, presence: true
end
