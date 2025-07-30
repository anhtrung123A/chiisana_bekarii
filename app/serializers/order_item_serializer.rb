class OrderItemSerializer
  include JSONAPI::Serializer
  attributes :id, :quantity, :price

  belongs_to :product, serializer: ProductSerializer
end
