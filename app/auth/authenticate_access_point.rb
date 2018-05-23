class AuthenticateAccessPoint
  def initialize(ip, password)
    @ip = ip
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(access_point_id: access_point.id) if access_point
  end

  private

  attr_reader :ip, :password

  # verify user credentials
  def access_point
    access_point = AccessPoint.find_by(ip: ip)
    return access_point if access_point && access_point.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
