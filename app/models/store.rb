class Store < ApplicationRecord
  STORE_PARAMS = [:name, :address, :phone, :user_id, images_attributes:
  [:id, :url, :alt, :image_type, :_destroy]].freeze

  belongs_to :user
  has_many :bills, dependent: :destroy
  has_many :combos, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :images, as: :imageable
  has_many :comments, as: :commentable, dependent: :destroy

  validates :address, presence: true
  validates :phone, presence: true

  accepts_nested_attributes_for :images, reject_if: :all_blank,
    allow_destroy: true
  
end
