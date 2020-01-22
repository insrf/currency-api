require 'rails_helper'

# RSpec.describe CurenciesController, type: :controller do
  describe "#index", :type => :request do
    let!(:currencies) {FactoryBot.create_list(:random_curency, 20)}

    before { get '/api/v1/curencies' }

    it 'returns all currencies' do
      expect(JSON.parse(response.body).size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show', :type => :request do
    let!(:curency) {FactoryBot.create(:curency)}

    before do
      get "/api/v1/curencies/#{curency.id}"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Curency attributes" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["id", "name", "rate"])
      expect(hash_body).to match({
        id: curency.id,
        name: curency.name,
        rate: curency.rate
        })
      end
    # end

end
