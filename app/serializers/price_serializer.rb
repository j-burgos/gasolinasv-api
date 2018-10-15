class PriceSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :price
  belongs_to :zone
  belongs_to :gas_type

  class ZoneSerializer < ActiveModel::Serializer
    attributes :id, :name
  end

  class GasTypeSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
