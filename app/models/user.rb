class User < ApplicationRecord
  # Validations
  validates :user_type, presence: true
  enum user_type: { landlord: 0, buyer: 1 }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, length: { in: 6..12 }
  validates :password, length: { minimum: 6 }, on: :create

  # Associations
  has_secure_token
  has_secure_password
  has_many :properties, dependent: :destroy
  has_many :buyer_properties, dependent: :destroy

  def invalidate_token
    update(token: nil)
  end
end
