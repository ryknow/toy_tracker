class ToyType
  include Mongoid::Document

  field :name, type: String
  field :img,  type: String

  validates_presence_of :name
end
