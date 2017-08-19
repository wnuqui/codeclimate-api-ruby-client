require 'spec_helper'

RSpec.describe CodeClimate::Client do
  let(:base_uri) { 'https://api.codeclimate.com/v1/' }
  let(:api_token) { 'abc40a334236eb8461afe1c041bed13097fab628' }

  it 'configures' do
    CodeClimate::Client.configure do |client|
      client.base_uri = base_uri
      client.api_token = api_token
    end

    expect(CodeClimate::Client.base_uri).to eq(base_uri)
    expect(CodeClimate::Client.api_token).to eq(api_token)
  end
end
