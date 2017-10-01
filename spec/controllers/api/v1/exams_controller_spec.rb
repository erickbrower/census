require 'rails_helper'

RSpec.describe Api::V1::ExamsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      create_list(:exam, 5)
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).length).to eq(5)
    end
  end

  describe "POST #create" do
    it "responds successfully" do
      user = create(:user)
      new_exam = build(:exam, user: user)
      post :create, {
        params: {
          exam: {
            user_id: user.id,
            title: new_exam.title
          }
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/exams\/\d$/)
      created_exam = JSON.parse(response.body)
      expect(created_exam['title']).to eq(new_exam.title)
      expect(created_exam['user_id']).to eq(user.id)
    end

    it "responds with errors" do
      post :create, {
        params: {
          exam: {
            title: '',
            user_id: ''
          }
        }
      }
      expect(response.status).to eq(422)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).not_to be_nil
      expect(parsed_response['errors'].length).to eq(2)
    end
  end

  describe "PUT #update" do
    it "responds successfully" do
      exam = create(:exam)
      new_title = 'A New Test Title'
      put :update, {
        params: {
          id: exam.id,
          exam: {
            title: new_title
          }
        }
      }
      expect(response).to have_http_status(:success)
      expect(response.headers['Location']).to eq("/api/v1/exams/#{exam.id}")
      parsed = JSON.parse(response.body)
      expect(parsed['title']).to eq(new_title)
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
