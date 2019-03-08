class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_access_control_headers

  def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    puts "creating event"
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if registered_application
      puts "found registered application"
      @event = registered_application.events.new(event_params)
      puts "created event"
      if @event.save
        puts "saved event"
        render json: @event, status: :created
      else
        puts "there was an error"
        puts @event.errors
        render json: {errors: @event.errors}, status: :unprocessable_entity
      end
    else
      puts "could not find application"
      render json: "Unregistered application", status: :unprocessable_entity
    end
  end

  def preflight
    head 200
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
