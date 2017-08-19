RSpec.describe CodeClimate::Resource::Org do
  let(:client) { CodeClimate::Client }

  subject do
    client.orgs.all
  end

  describe 'GET /orgs' do
    it 'requests' do
      VCR.use_cassette('code_climate/orgs/list') do
        expect { subject }.not_to raise_error
      end
    end

    xit 'returns an array of CodeClimate::Resource::Org' do
      VCR.use_cassette('code_climate/orgs/list') do
        expect(subject).to be_a_list_of(CodeClimate::Resource::Org)
      end
    end
  end
end
