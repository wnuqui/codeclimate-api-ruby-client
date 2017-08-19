RSpec.describe CodeClimate::Resource::Snapshot do
  let(:client) { CodeClimate::Client }

  subject do
    client
      .snapshots
      .where(repo_id: '592e3170b12e120271000199')
      .find('5976875ea05a4400010030b1')
  end

  describe 'GET /repos/:repo_id/snapshots/:snapshot_id' do
    it 'returns an array of CodeClimate::Resource::Snapshot' do
      VCR.use_cassette('code_climate/snapshots/show') do
        expect(subject).to be_a_list_of(CodeClimate::Resource::Snapshot)
      end
    end
  end
end
