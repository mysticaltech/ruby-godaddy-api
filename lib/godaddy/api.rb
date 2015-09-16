require 'net/https'
require 'json'

module Godaddy
  class APIError < StandardError; end

  class Api
    API_URL = 'https://api.godaddy.com'

    def initialize(apikey, apisecret)
      @headers = {
        'Authorization' => "sso-key #{apikey}:#{apisecret}",
        'Content-type' => 'application/json'
      }
    end

    [:get, :post, :put, :patch, :delete].each do |method|
      define_method method do |uri, payload = nil|
        uri = URI(API_URL + uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP.const_get(method.capitalize).new uri, @headers
        request.body = payload.to_json if payload
        response = http.request(request)
        result = JSON.parse(response.body)

        fail APIError, result unless response.is_a?(Net::HTTPSuccess)

        result
      end
    end
  end
end
