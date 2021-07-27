class UserHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: String
  field :products_history, type: Array
  field :collections_history, type: Array
  field :search_keywords, type: Hash
  field :collections, type: Hash
  field :products, type: Hash

  def self.collections
    :collections
  end

  def user_id
    :user_id
  end

  store_in collection: "user_history", database: "hammer"
end
