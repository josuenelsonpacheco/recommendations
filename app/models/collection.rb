class Collection

  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String
  field :name, type: String
  field :description, type: String

  def class_name
    self.class.name
  end
  
  def as_json(options = nil)
    options = {:root => false}
    super(options)
end

  store_in collection: "collections", database: "hammer"
end
