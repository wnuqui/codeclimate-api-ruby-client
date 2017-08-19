RSpec.describe CodeClimate::Resource::Service do
  let(:client) { CodeClimate::Client }

  let(:repo) do
    VCR.use_cassette('code_climate/repos/get') do
      client.repos.at('592e3170b12e120271000199')
    end
  end

  describe 'GET /repos/repo_id/services' do
    it 'returns an array of CodeClimate::Resource::Service' do
      VCR.use_cassette('code_climate/services/list') do
        expect(repo.services).to be_a_list_of(CodeClimate::Resource::Service)
      end
    end
  end
end
