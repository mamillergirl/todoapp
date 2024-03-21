# vercel/api.rb

require 'json'
require 'rack'
require_relative './config/environment' # Path to your Rails environment file

def handler(event:, context:)
  request = Rack::Request.new(event)
  status, headers, body = Rails.application.call(request.env)
  {
    statusCode: status,
    headers: headers,
    body: body.each(&:freeze)
  }
end
