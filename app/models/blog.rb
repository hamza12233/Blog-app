class Blog < ApplicationRecord
  belongs_to :user

  ATTRIBUTES_WHITELIST = [
    :id,
    :title,
    :description
  ].freeze

  validates :title, presence: true, length: {minimum:3}

  scope :search_blog, ->(blog) { where("title LIKE ?", "%"+blog+"%") }

  def as_json
    super({
      include: {
        user: {only: %i[name email]}
      }
    })
  end
end
