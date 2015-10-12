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

end
