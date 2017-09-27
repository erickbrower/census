require 'rails_helper'

RSpec.describe Api::V1::ExamsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      create_list(:exam, 5)
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_collection_response_for('exams')
    end
  end

  describe "POST #create" do
    it "responds successfully" do
      user = create(:user)
      new_exam = build(:exam, user: user)
      post :create, {
        params: {
          data: {
            type: 'exams',
            attributes: {
              title: new_exam.title,
              user_id: user.id
            }
          }
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/exams\/\d$/)
      expect(response.body).to be_jsonapi_response_for('exams')
    end

    it "responds with errors" do
      post :create, {
        params: {
          data: {
            type: 'exams',
            attributes: {}
          }
        }
      }
      expect(response.status).to eq(422)
      expect(response.body).to have_jsonapi_errors_for('/data/attributes/title')
    end
  end

  describe "PUT #update" do
    it "responds successfully" do
      exam = create(:exam)
      new_title = 'A New Test Title'
      put :update, {
        params: {
          id: exam.id,
          data: {
            type: 'exams',
            attributes: {
              title: new_title
            }
          }
        }
      }
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_response_for('exams')
      parsed = JSON.parse(response.body)
      expect(parsed.dig('data', 'attributes', 'title')).to eq(new_title)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      exam = create(:exam)
      get :show, { params: { id: exam.id } }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      get :show, { params: { id: 12345 } }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      exam = create(:exam)
      delete :destroy, params: { id: exam.id }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      delete :destroy, params: { id: 12345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
