class BuyerProperty < ApplicationRecord
  # Validations
  enum property_status: { favorite: 0, contacted: 1 }

  # Associations
  belongs_to :property
  belongs_to :user
end
