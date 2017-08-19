RSpec.describe CodeClimate::Resource::Repo do
  let(:client) { CodeClimate::Client }

  subject { client.repos.at('592e3170b12e120271000199') }

  describe 'GET /repos/:repo_id' do
    it 'returns CodeClimate::Resource::Repo object' do
      VCR.use_cassette('code_climate/repos/get') do
        expect(subject).to be_kind_of(CodeClimate::Resource::Repo)
      end
    end
  end
end
