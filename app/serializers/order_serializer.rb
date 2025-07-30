class OrderSerializer
  include JSONAPI::Serializer
  attributes :id, :status, :total_price, :created_at

  attribute :user do |order|
    {
      id: order.user.id,
      email: order.user.email
    }
  end
  
  attribute :order_items do |order|
    order.order_items.map do |item|
      {
        id: item.id,
        quantity: item.quantity,
        price: item.price,
        product: {
          id: item.product.id,
          name: item.product.name,
          price: item.product.price
        }
      }
    end
  end

end
