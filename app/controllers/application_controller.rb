class ApplicationController < ActionController::API
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    render json: {
      status: {
        code: 403,
        message: "You are not authorized to perform this action: #{exception.policy.class}##{exception.query}"
      }
    }, status: :forbidden
  end
end
