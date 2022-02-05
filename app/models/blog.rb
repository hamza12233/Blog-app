class Blog < ApplicationRecord
  belongs_to :user

  ATTRIBUTES_WHITELIST = [
    :id,
    :title,
    :description
  ].freeze

  validates :title, presence: true, length: {minimum:3}
end
