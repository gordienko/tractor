class Embed < ApplicationRecord
  include ActionText::Attachable
  require 'oembed'

  after_create :setup


  def setup
    OEmbed::Providers.register_all
    puts url
    resource = OEmbed::Providers.get(url, {width: '500px'})
    self.video  = resource.video?
    if resource.video?
      self.thumbnail_url = resource.thumbnail_url
    end
    self.html = resource.html
    self.save
  end

  def to_trix_content_attachment_partial_path
    "embeds/thumbnail"
  end
end
