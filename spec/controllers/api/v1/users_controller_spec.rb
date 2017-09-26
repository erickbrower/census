require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      create_list(:user, 5)
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_collection_response_for('users')
    end
  end

  describe "POST #create" do
    let(:user) { User.create }

    it "responds successfully" do
      new_user = build(:user)
      post :create, {
        params: {
          data: {
            type: 'users',
            attributes: {
              email: new_user.email,
              password: new_user.password
            }
          }
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/users\/\d$/)
      expect(response.body).to be_jsonapi_response_for('users')
    end

    it "responds with errors" do
      post :create, {
        params: {
          data: {
            type: 'users',
            attributes: {}
          }
        }
      }
      expect(response.status).to eq(422)
      expect(response.body).to have_jsonapi_errors_for('/data/attributes/email')
      expect(response.body).to have_jsonapi_errors_for('/data/attributes/password')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      user = create(:user)
      get :show, { params: { id: user.id } }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      get :show, { params: { id: 12345 } }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      user = create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      delete :destroy, params: { id: 12345 }
      expect(response).to have_http_status(:not_found)
    end
  end

end
