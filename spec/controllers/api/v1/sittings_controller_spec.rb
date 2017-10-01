require 'rails_helper'

RSpec.describe Api::V1::SittingsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      create_list(:sitting, 5)
      get :index
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data.length).to eq(5)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      user = create(:user)
      exam = create(:exam)
      new_sitting = build(:sitting, exam: exam, user: user)
      post :create, params: {
        sitting: {
          user_id: user.id,
          exam_id: exam.id,
          score: new_sitting.score
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/sittings\/\d$/)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['user_id']).to eq(user.id)
      expect(parsed_data['exam_id']).to eq(exam.id)
      expect(parsed_data['score']).to eq(new_sitting.score)
    end

    it 'responds with errors' do
      post :create, params: {
        sitting: {
          score: 'A'
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'PUT #update' do
    it 'responds successfully' do
      sitting = create(:sitting)
      new_score = 50
      put :update, params: {
        id: sitting.id,
        sitting: {
          score: new_score
        }
      }
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['score']).to eq(new_score)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      sitting = create(:sitting)
      get :show, params: { id: sitting.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      get :show, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      sitting = create(:sitting)
      delete :destroy, params: { id: sitting.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      delete :destroy, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
