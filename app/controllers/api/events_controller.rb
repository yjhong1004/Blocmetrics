class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
