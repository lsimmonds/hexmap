class Country < ActiveRecord::Base
  belongs_to :map, inverse_of: :countries, touch: true
  has_many :provinces, :inverse_of => :country
end
