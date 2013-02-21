class ToyType
  include Mongoid::Document

  embeds_many :toys

  field :name, type: String
  field :img,  type: String

  validates_presence_of :name
end
