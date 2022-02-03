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
# Indexes
#
#  index_pages_on_slug  (slug) UNIQUE
#

class Page < ApplicationRecord
  extend FriendlyId
  include ActionText::Attachable

  friendly_id :title, use: :slugged

  validates :title, presence: true

  validates :template, presence: true
  has_rich_text :content
  has_rich_text :content_two
  acts_as_list

  def should_generate_new_friendly_id?
    slug.blank?
  end

  def self.templates
    ['Standard', 'Contact', 'History' ]
  end

  def to_trix_content_attachment_partial_path
    # you need to use this so each time editor is brought up this partial is used.  also set this partial in controller
    "links/link"
  end
end
