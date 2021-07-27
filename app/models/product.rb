class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id, type: String
  field :name, type: String

  store_in collection: "products", database: "hammer"
end
