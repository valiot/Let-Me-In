class Event::BoletiaApiController < ApplicationController
  def send_request
    @response = RestClient::Request.execute(
      method: :get,
      url: "https://boletiaapi.com/api/v1/search/events/#{params[:boletia_id]}/tickets?number=#{params[:id]}",
      headers: { 'authorization' => 'Bearer a52a81ff-837d-4f25-8d82-1aefee825103' },
      verify_ssl: OpenSSL::SSL::VERIFY_NONE
    )
    render json: @response
  end
end
