RSpec.describe CodeClimate::Resource::TestReport do
  let(:client) { CodeClimate::Client }

  let(:repo) do
    VCR.use_cassette('code_climate/repos/get') do
      client.repos.at('592e3170b12e120271000199')
    end
  end

  describe 'GET /repos/repo_id/test_reports' do
    it 'returns an array of CodeClimate::Resource::TestReport' do
      VCR.use_cassette('code_climate/test_reports/list') do
        expect(repo.test_reports).to be_a_list_of(CodeClimate::Resource::TestReport)
      end
    end
  end
end
