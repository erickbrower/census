require 'rails_helper'

RSpec.describe Api::V1::ResponsesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      create_list(:response, 5)
      get :index
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data.length).to eq(5)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      sitting = create(:sitting)
      answer = create(:answer)
      post :create, params: {
        response: {
          sitting_id: sitting.id,
          answer_id: answer.id
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/responses\/\d$/)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['answer_id']).to eq(answer.id)
      expect(parsed_data['sitting_id']).to eq(sitting.id)
    end
  end

  describe 'PUT #update' do
    it 'responds successfully' do
      new_answer = create(:answer)
      resp = create(:response)
      put :update, params: {
        id: resp.id,
        response: {
          answer_id: new_answer.id
        }
      }
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['answer_id']).to eq(new_answer.id)
    end

    it 'responds with errors' do
      resp = create(:response)
      put :update, params: {
        id: resp.id,
        response: {
          answer_id: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      answer = create(:response)
      get :show, params: { id: answer.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      get :show, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      resp = create(:response)
      delete :destroy, params: { id: resp.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      delete :destroy, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
