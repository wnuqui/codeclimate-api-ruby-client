RSpec.describe CodeClimate::Resource::Metric do
  let(:client) { CodeClimate::Client }

  let(:repo) do
    VCR.use_cassette('code_climate/repos/get') do
      client.repos.at('592e3170b12e120271000199')
    end
  end

  subject { repo.metrics(from: '2017-05-01', to: '2017-08-01') }

  describe 'GET /repos/:repo_id/metrics/:name?filter[from]=YYYY-MM-DD&filter[to]=YYYY-MM-DD' do
    it 'returns an array of CodeClimate::Resource::Metric' do
      VCR.use_cassette('code_climate/metrics/gpa') do
        expect(subject).to be_a_list_of(CodeClimate::Resource::Metric)
      end
    end
  end
end
