class Payment < ApplicationRecord
  validates :amount, presence: true

  belongs_to :sender_account, class_name: "AccountInfo", foreign_key: "sender_account_id"
  belongs_to :recipient_account, class_name: "AccountInfo", foreign_key: "recipient_account_id"
end
