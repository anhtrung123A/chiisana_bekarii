class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    products = Product.all

    if products.empty?
      render json: {
        status: { code: 404, message: "Products couldn't be found." },
      }, status: :not_found
    else
      # Mapping every item in products list into serialized one.
      serialized_products = ProductSerializer.new(products).serializable_hash[:data].map { |product| product[:attributes] }
      render json: {
        status: { code: 200, message: "Products list." },
        data: serialized_products
      }, status: :ok
    end
  end

  def create
    product = Product.new(product_params)
    authorize product
    if product.save
      render json: {
        status: { code: 201, message: "Created new product successfully." },
        data: ProductSerializer.new(product).serializable_hash[:data][:attributes]
      }, status: :created
    else
      render json: {
        status: { message: "Product couldn't be created successfully. #{product.errors.full_messages.to_sentence }"}, status: :unprocessable_entity
      }
    end
  end

  def show
    product = Product.find(params[:id])

    if product
      render json: {
        status: { code: 200, message: "Retrieve product with id #{params[:id]}." },
        data: ProductSerializer.new(product).serializable_hash[:data][:attributes]
      }, status: :ok
    else 
      render json: {
        status: { code: 404, message: "Product with id #{params[:id]} couldn't be found." },
      }, status: :not_found
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    
    if product
      product.destroy
      render json: {
        status: { code: 200, message: "Deleted product with id #{params[:id]} successfully." }
      }, status: :ok
    else
      render json: {
        status: { code: 404, message: "Product with id #{params[:id]} not found." }
      }, status: :not_found
    end
  end

  private 

  def product_params
    params.permit(:name, :description, :price, images: [])
  end

  private 

  def product_params
    params.permit(:name, :description, :price, images: [])
  end
  
end
