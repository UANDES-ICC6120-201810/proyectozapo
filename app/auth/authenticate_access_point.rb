class AuthenticateAccessPoint
  def initialize(code)
    @code = code
  end

  # Service entry point
  def call
    JsonWebToken.encode(bus_stop_code: bus_stop.code) if bus_stop
  end

  private

  attr_reader :code

  # verify user credentials
  def bus_stop
    bus_stop = BusStop.find_by(code: code)
    return bus_stop
  end
end
