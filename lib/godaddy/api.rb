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
        request = build_request method, uri, payload
        response = http.request(request)
        begin
          result = JSON.parse(response.body)
        rescue
          result = response.body
        end

        fail APIError, result unless response.is_a?(Net::HTTPSuccess)

        result
      end
    end

    private

    def build_request(method, uri, payload = nil)
      if payload
        method == :get ? uri.query = URI.encode_www_form(payload) : body = payload.to_json
      end
      request = Net::HTTP.const_get(method.capitalize).new uri, @headers
      request.body = body if body
      request
    end
  end
end
