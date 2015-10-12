require 'json'
require 'net/http'
require_relative 'exceptions'

class API
  
  def initialize(server, path, use_ssl)
  	@server = server
  	@path = path
  	@use_ssl = use_ssl
  end

  def server_version
  	uri = build_uri("/")
  	res = Net::HTTP.get_response(uri)

  	if !valid_response?(res.body)
  	  raise InvalidAPIResponse.new
  	end

  	parsed_response = JSON.parse(res.body)
  	parsed_response["api_version"]
  end

  def build_uri(api)
  	URI(build_url(api))
  end

  def build_url(api)
   	if @use_ssl == true
  	  request_method = "https://"
  	else
      request_method = "http://"
    end

    request_method + @server + @path + api
  end

  def valid_response?(response)
  	begin
  	  JSON.parse(response)
  	rescue JSON::ParserError => e
  	  return false
  	end

  	true
  end

end