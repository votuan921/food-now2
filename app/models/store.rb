class Store < ApplicationRecord
  STORE_PARAMS = [:name, :address, :phone, :district_id, :user_id, images_attributes:
  [:id, :url, :alt, :image_type, :_destroy]].freeze

  belongs_to :user
  belongs_to :district
  has_many :bills, dependent: :destroy
  has_many :combos, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :images, as: :imageable

  delegate :name, to: :district, prefix: true

  validates :address, presence: true
  validates :phone, presence: true
  validates :district_id, presence: true

  accepts_nested_attributes_for :images, reject_if: :all_blank,
    allow_destroy: true
  scope :by_province_id, ->(province_id){where(districts: {province_id: province_id})}
end
