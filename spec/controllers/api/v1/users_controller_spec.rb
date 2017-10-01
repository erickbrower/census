require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      create_list(:user, 5)
      get :index
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      new_user = build(:user)
      post :create, params: {
        user: {
          email: new_user.email,
          password: new_user.password,
          password_confirmation: new_user.password_confirmation
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/users\/\d$/)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['email']).to eq(new_user.email)
    end

    it 'responds with errors' do
      post :create, params: {
        user: {
          email: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'PUT #update' do
    it 'responds successfully' do
      user = create(:user)
      new_email = 'test@test.com'
      put :update, params: {
        id: user.id,
        user: {
          email: new_email
        }
      }
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['email']).to eq(new_email)
    end

    it 'responds with errors' do
      user = create(:user)
      put :update, params: {
        id: user.id,
        user: {
          email: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      get :show, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      user = create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      delete :destroy, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
