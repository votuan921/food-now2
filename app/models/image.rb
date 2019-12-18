class Image < ApplicationRecord
  enum image_type: {image: 0, thumbnail: 1, banner: 2}

  belongs_to :imageable, polymorphic: true

  mount_uploader :url, ImageUploader
end
