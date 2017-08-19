RSpec.describe CodeClimate::Resource::RefPoint do
  let(:client) { CodeClimate::Client }

  let(:repo) do
    VCR.use_cassette('code_climate/repos/get') do
      client.repos.at('592e3170b12e120271000199')
    end
  end

  describe 'GET /repos/:repo_id/ref_points' do
    it 'returns an array of CodeClimate::Resource::RefPoint' do
      VCR.use_cassette('code_climate/ref_points/list') do
        expect(repo.ref_points).to be_a_list_of(CodeClimate::Resource::RefPoint)
      end
    end
  end
end
