class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :text, type: String

  store_in collection: "articles", database: "hammer"
end
