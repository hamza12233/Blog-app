class Blog < ApplicationRecord
  belongs_to :user

  ATTRIBUTES_WHITELIST = [
    :id,
    :title,
    :description
  ].freeze

  validates :title, presence: true, length: {minimum:3}

  def as_json
    super({
      include: {
        user: {only: %i[name email]}
      }
    })
  end
end
