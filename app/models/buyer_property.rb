class BuyerProperty < ApplicationRecord
  # Validations
  enum type: { favorite: 0, contacted: 1 }

  # Associations
  belongs_to :property
  belongs_to :user
end
