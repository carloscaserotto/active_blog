class Post < ApplicationRecord
  has_one_attached :header_image   # Use has_one_attached for only one file allowed
  has_many_attached :files         # Use has_many_attached for multiple files allowed
  validate :acceptable_image

  private
  def acceptable_image
    return unless header_image.attached?

    unless header_image.byte_size <= 1.megabyte
      errors.add(:main_image, "is too big")
    end
    
    acceptable_types = ["image/jpeg", "image/png"]
    
    unless acceptable_types.include?(header_image.content_type)
    errors.add(:header_image, "must be a JPEG or PNG")
    end
  end
end
