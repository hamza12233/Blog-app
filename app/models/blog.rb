class Blog < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase

  belongs_to :user

  ATTRIBUTES_WHITELIST = [
    :id,
    :title,
    :description
  ].freeze

  validates :title, presence: true, length: {minimum:3}

  scope :search_blog, ->(blog) { where("title LIKE ?", "%"+blog+"%") }

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :title, analyzer: 'english'
    end
  end

  def as_indexed_json(options = nil)
    self.as_json( only: [ :title ] )
  end

  def self.search(query)
    __elasticsearch__.search(
    {
      query: {
         multi_match: {
           query: query,
           fields: ['title^5']
         }
       },
    })
  end

  def as_json
    super({
      include: {
        user: {only: %i[name email]}
      }
    })
  end
end
