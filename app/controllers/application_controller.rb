class ApplicationController < ActionController::API
  def authenticate_user
    api_key = params[:api_key] || request.headers["HTTP_AUTHORIZATION"]

    raise ArgumentError, "no api key provided" if api_key.blank?

    @current_user = User.find_by(api_key: api_key)

    raise ArgumentError, "Invalid user" if @current_user.nil?
  end
end
