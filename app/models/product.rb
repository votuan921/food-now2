class Product < ApplicationRecord
  PRODUCT_PARAMS = [:name, :price, :store_id, :status, images_attributes:
    [:id, :url, :alt, :image_type, :_destroy]].freeze

  enum status: {in_active: 0, active: 1}

  belongs_to :store
  has_many :combo_products, dependent: :destroy
  has_many :bill_details, as: :bill_detailable, dependent: :destroy
  has_many :images, as: :imageable

  validates :name, presence: true, length:
    {minimum: Settings.product.min_name_length, maximum: Settings.product.max_name_length}
  validates :price, presence: true
  validates :store_id, presence: true

  accepts_nested_attributes_for :images, reject_if: :all_blank,
    allow_destroy: true

  scope :products_of_current_user, ->(product_ids){where id: product_ids}
  scope :by_store_id, ->(store_id){where store_id: store_id}
  scope :by_product_ids, ->(product_ids){where id: product_ids}
end
