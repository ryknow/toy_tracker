class Toy
  include Mongoid::Document

  embedded_in :toy_type

  field :name,        type: String
  field :description, type: String

  validates_presence_of :name
end
