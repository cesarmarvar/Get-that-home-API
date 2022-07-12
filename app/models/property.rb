class Property < ApplicationRecord
  # Validations
  validates :address, presence: true, uniqueness: true
  validates :price, numericality: { less_than: 99_999_999.99 }
  validates :maintenance, numericality: { less_than: 99_999_999.99 }, allow_nil: true
  enum property_type: { apartment: 0, house: 1 }
  validates :pets, presence: true
  validates :about, length: { maximum: 300 }, presence: true
  enum operation_type: { rent: 0, sale: 1 }
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :area, presence: true

  # Associations
  belongs_to :user
  has_many_attached :photos
  has_many :buyer_properties, dependent: :destroy
end
