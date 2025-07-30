class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      message: "Hello, World!"
    }, status: :ok
  end
end
