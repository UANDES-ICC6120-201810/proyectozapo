class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  before_action :authenticate_user!
  attr_reader :current_access_point

  private

  # Check for valid request token and return user
  def authorize_request
    @current_acces_point = (AuthorizeApiRequest.new(request.headers).call)[:acces_point]
  end
end
