# == Schema Information
#
# Table name: medias
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Media < ApplicationRecord
  include ActionText::Attachable
  has_one_attached :file do |attachable|
    attachable.variant :thumb, resize_to_fill: [360, 260]
    attachable.variant :minithumb, resize_to_fill: [200, 200]
    attachable.variant :microthumb, resize_to_fill: [100, 100]
  end
  #validate :correct_document_mime_type
  validates :name, presence: true

  validate :file_is_attached

  attr_accessor :file_destroy
  include Destroyable

  def file_is_attached
    unless file.attached?
      errors.add(:file, 'File is required')
    end
  end

  def correct_document_mime_type
   if file.attached?
    if !file.content_type.in?(%w(image/jpeg image/png application/pdf application/vnd.openxmlformats-officedocument.wordprocessingml.document application/msword application/pdf application/vnd.openxmlformats-officedocument.spreadsheetml.sheet))
       errors.add(:file, 'Upload an Image')
    end
   end
 end

 def height
    file.metadata['height']
  end

  def width
    file.metadata['width']
  end

 def to_s
   if file.attached?
     file.filename
   end
 end
end
