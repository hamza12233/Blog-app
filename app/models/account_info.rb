class AccountInfo < ApplicationRecord

  ATTRIBUTES_WHITELIST = [
    :name_on_card,
    :card_number,
    :expiry_month,
    :expiry_year,
    :amount
  ].freeze

  validates :name_on_card, :expiry_month, :expiry_year, :amount, presence: true
  validates :card_number, presence: true, length: { is:16, message: 'invalid' }

  belongs_to :user
  has_many :payments, dependent: :destroy
end
