RSpec.describe CodeClimate::Resource::Build do
  let(:client) { CodeClimate::Client }

  let(:repo) do
    VCR.use_cassette('code_climate/repos/get') do
      client.repos.at('592e3170b12e120271000199')
    end
  end

  describe 'GET /repos/:repo_id/builds' do
    it 'returns an array of CodeClimate::Resource::Build' do
      VCR.use_cassette('code_climate/builds/list') do
        expect(repo.builds).to be_a_list_of(CodeClimate::Resource::Build)
      end
    end
  end
end
