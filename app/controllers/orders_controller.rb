class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = current_user.orders.new()
    total = 0

    params[:order_items].each do |item|
      product = Product.find(item[:product_id])
      quantity = item[:quantity].to_i
      price = product.price.to_f

      total += price * quantity

      order.order_items.build(
        product: product,
        quantity: quantity,
        price: price,
        note: item[:note]
      )
    end

    order.total_price = total
    serialized_order = OrderSerializer.new(order).serializable_hash[:data][:attributes]
    ActionCable.server.broadcast("orders", serialized_order)
    if order.save
      render json: { status: { code: 201, message: "Order created." }, data: serialized_order }, status: :created
    else
      render json: { status: { code: 422, message: "Failed to create order." }, errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    orders = policy_scope(Order)
    serialized_orders = OrderSerializer.new(orders).serializable_hash[:data].map { |order| order[:attributes] }
    render json: {
      status: { code: 200, message: "Order list." },
      data: serialized_orders
    }, status: :ok
  end
  
  def show
    order = Order.find(params[:id])
    authorize order

    render json: {
      status: { code: 200, message: "Order detail." },
      data: OrderSerializer.new(order).serializable_hash[:data][:attributes]
    }, status: :ok
  end

end
