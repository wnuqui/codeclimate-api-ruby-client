RSpec.describe CodeClimate::Resource::User do
  let(:client) { CodeClimate::Client }

  describe 'GET /user' do
    it 'returns CodeClimate::Resource::User object' do
      VCR.use_cassette('code_climate/user') do
        expect(client.current_user).to be_kind_of(CodeClimate::Resource::User)
      end
    end
  end
end
