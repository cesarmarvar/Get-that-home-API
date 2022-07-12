class BuyerProperty < ApplicationRecord
  belongs_to :property
  belongs_to :user

  enum type: { favorite: 0, contacted: 1 }

end
