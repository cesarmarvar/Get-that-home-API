class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :address, presence: true, uniqueness: true
  validates :price, numericality:{ less_than: 99999999.99}
  validates :maintenance, numericality:{ less_than: 99999999.99}, allow_nil: true
  enum property_type: { apartment: 0, house: 1 }
  validates :pets, presence: true
  validates :about, length: { maximum: 300 }, presence: true
  enum operation_type: { rent: 0, sale: 1 } 
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :area, presence: true
end
