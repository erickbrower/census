require 'rails_helper'

RSpec.describe Api::V1::ResponsesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      create_list(:response, 5)
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_collection_response_for('responses')
    end
  end

  describe "POST #create" do
    it "responds successfully" do
      sitting = create(:sitting)
      answer = create(:answer)
      new_response = build(:response, sitting: sitting, answer: answer)
      post :create, {
        params: {
          data: {
            type: 'responses',
            attributes: {
              sitting_id: sitting.id,
              answer_id: answer.id
            }
          }
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/responses\/\d$/)
      expect(response.body).to be_jsonapi_response_for('responses')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      answer = create(:response)
      get :show, { params: { id: answer.id } }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      get :show, { params: { id: 12345 } }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      resp = create(:response)
      delete :destroy, params: { id: resp.id }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      delete :destroy, params: { id: 12345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
