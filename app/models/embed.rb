# == Schema Information
#
# Table name: embeds
#
#  id            :integer          not null, primary key
#  url           :string
#  video         :boolean
#  html          :text
#  thumbnail_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Embed < ApplicationRecord
  include ActionText::Attachable
  require 'oembed'

  after_create :setup
  def setup
    resource = oembed
    self.video  = resource.video?
    if resource.video?
      self.thumbnail_url = resource.thumbnail_url
    end
    self.html = resource.html
    self.save
  end

  def oembed
    OEmbed::Providers.register_all
    return OEmbed::Providers.get(url, {width: '500px'})
  end

  def to_trix_content_attachment_partial_path
    "embeds/thumbnail"
  end
end
