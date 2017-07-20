class Event::BoletiaapiController < ApplicationController

  def send_request
    require 'uri'
    require 'net/http'
    id = params[:id]
    url = URI("https://boletiaapi.com/api/v1/search/events/123249/tickets?number="+id)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer a52a81ff-837d-4f25-8d82-1aefee825103'
    request["cache-control"] = 'no-cache'

    @response = http.request(request)
    render :json => {
            :file_content => @response.read_body
        }
  end
end
