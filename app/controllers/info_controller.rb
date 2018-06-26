class InfoController < ApplicationController
  skip_before_action :authenticate_user!
  def api_info
  end
end
