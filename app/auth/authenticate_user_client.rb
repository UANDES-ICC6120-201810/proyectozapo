class AuthenticateUserClient
  def initialize(id)
    @id = id
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_client_id: user_client.id) if user_client
  end

  private

  attr_reader :id

  # verify user credentials
  def user_client
    user_client = SubscribedCustomer.find_by(id: id)
    return user_client
  end
end