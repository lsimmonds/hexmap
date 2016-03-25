class Hex < ActiveRecord::Base
  belongs_to :map, inverse_of: :hexes, touch: true
end
