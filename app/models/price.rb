class Price < ApplicationRecord
    belongs_to :gas_type
    belongs_to :zone
end
