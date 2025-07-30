class ProductSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :price

  attribute :image_urls do |product|
    if product.images.attached?
      product.images.map { |img| Rails.application.routes.url_helpers.url_for(img) }
    else
      []
    end
  end
end
