require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      exam = create(:exam)
      create_list(:question, 5, exam: exam)
      get :index
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data.length).to eq(5)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      exam = create(:exam)
      new_question = build(:question, exam: exam)
      post :create, params: {
        question: {
          text: new_question.text,
          exam_id: exam.id
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/questions\/\d$/)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['text']).to eq(new_question.text)
    end

    it 'responds with errors' do
      post :create, params: {
        question: {
          text: '',
          exam_id: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'PUT #update' do
    it 'responds successfully' do
      question = create(:question)
      new_text = 'test test test'
      put :update, params: {
        id: question.id,
        question: {
          text: new_text
        }
      }
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['text']).to eq(new_text)
    end

    it 'responds with errors' do
      question = create(:question)
      put :update, params: {
        id: question.id,
        question: {
          text: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      question = create(:question)
      get :show, params: { id: question.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      get :show, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      question = create(:question)
      delete :destroy, params: { id: question.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      delete :destroy, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
