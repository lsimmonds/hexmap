class Province < ActiveRecord::Base
  belongs_to :country, -> { includes :map }, inverse_of: :provinces, touch: true
end
