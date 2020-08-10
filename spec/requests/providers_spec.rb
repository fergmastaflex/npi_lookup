require 'rails_helper'

describe ProvidersController do
  let(:fixture) { File.read(Rails.root.join('spec','fixtures','npi_response.json')) }
  let(:example_response) { JSON.parse(fixture) }
  before { allow(HTTParty).to receive(:get).and_return(example_response) }

  describe 'GET index' do
    before do
      4.times do
        Provider.create!(npi: rand(10000..20000), name: 'foo')
      end
    end
    it 'returns all providers' do
      get '/providers'
      expect(assigns(:providers).count).to eq(4)
      expect(assigns(:providers)).to all(be_a(Provider))
    end

    context 'provided number' do
      it 'creates a new record' do
        expect(HTTParty).to receive(:get)
        expect { get '/providers?query=123' }.to change { Provider.count }.by(1)
      end
    end

    context 'error' do
      before { allow(NpiService).to receive(:get_provider).and_raise(ErrorHandler::NpiError) }

      it 'raises an error message' do
        get '/providers?query=123'
        expect(response).to redirect_to(providers_path)
      end
    end
  end
end
