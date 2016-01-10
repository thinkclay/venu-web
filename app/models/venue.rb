class Venue
  include Mongoid::Document
  field :name, type: String
  field :banner, type: String
end
