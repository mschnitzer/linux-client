require_relative '../../lib/api'

describe "API" do

  before(:all) do
    @api = API.new("samp-plugins.net", "/api", true)
  end

  it "builds the URL for an API request" do
    expect(@api.build_url("/")).to eq("https://samp-plugins.net/api/")
  end

  it "returns the correct API version" do
    expect(@api.server_version).to eq("1.0.0")
  end

  it "checks for the correctness of the API server response" do
    expect(@api.valid_response?("ABC")).to be(false)
    expect(@api.valid_response?('{ "name": "mschnitzer" }')).to be(true)
  end

  it "checks if the server respons with a valid search result" do
    expect(@api.search_plugins([ "hashlib" ])).to eq('[{"plugin":"hashlib","author":"mschnitzer"}]')
    expect(@api.search_plugins([ "hashlib", "hash" ])).to eq('[{"plugin":"hashlib","author":' \
      '"mschnitzer"},{"plugin":"hashlib","author":"mschnitzer"}]')
  end

  it "checks if send data returns the response of a server" do
    uri = URI("https://www.samp-plugins.net/api/echo")
    expect(@api.send_data(uri, "It works!")).to eq("It works!")
  end

end
