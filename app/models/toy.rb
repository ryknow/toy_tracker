class Toy
  include Mongoid::Document

  field :name,     type: String
  field :material, type: String
  field :talking,  type: Boolean
  field :size,     type: String

  validates_presence_of :name
end
