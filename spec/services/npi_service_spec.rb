require 'rails_helper'

describe NpiService do
  let(:number) { '1234567' }
  let(:fixture) { File.read(Rails.root.join('spec','fixtures','npi_response.json')) }
  let(:example_response) { JSON.parse(fixture) }
  let(:npi) { example_response['results'].first['number'] }
  let(:name) { example_response['results'].first['basic']['name'] }
  let(:addresses) { example_response['results'].first['addresses'] }
  let(:taxonomies) { example_response['results'].first['taxonomies'] }

  subject { described_class.new(number) }

  describe '#get_provider' do
    before { allow(HTTParty).to receive(:get).and_return(example_response) }

    it 'returns hash of provider attributes' do
      expect(subject.get_provider[:npi]).to eq(npi)
      expect(subject.get_provider[:name]).to eq(name)
      expect(subject.get_provider[:addresses]).to eq(addresses)
      expect(subject.get_provider[:taxonomies]).to eq(taxonomies)
    end
  end
end
