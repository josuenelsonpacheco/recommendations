class Collect #< ActiveRecord::Base
  include Mongoid::Document
  include Mongoid::Timestamps

  field :collection_id, type: String
  field :product_id, type: String

  store_in collection: "collects", database: "hammer"
end
