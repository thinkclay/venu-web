#
# Example Model for Testing and Demoing
#
class Example
  include Mongoid::Document
  include Mongoid::Paperclip

  field :string, type: String
  field :integer, type: Integer
  field :float, type: Float
  field :decimal, type: Float
  field :square_solid_checkbox, type: Boolean
  field :email, type: String
  field :url, type: String
  field :phone, type: String
  field :password, type: String
  field :search, type: String
  field :uuid, type: String
  field :range, type: String
  field :date_time, type: DateTime
  field :date, type: Date
  field :time, type: Time
  field :select, type: String
  field :radio, type: String
  field :checkbox, type: String

  has_many :users
  has_and_belongs_to_many :examples

  has_mongoid_attached_file :file,
    path:           ':attachment/:id-:style.:extension',
    storage:        :s3,
    bucket:         ENV['S3_BUCKET'],
    s3_host_alias:  'unpacked-assets.s3-us-west-1.amazonaws.com',
    s3_protocol:    'https',
    url:            ":s3_alias_url"

end