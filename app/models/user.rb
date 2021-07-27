class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :id_type, type: String
  field :identification, type: String
  field :last_name, type: String

  store_in collection: "users", database: "hammer"
end
