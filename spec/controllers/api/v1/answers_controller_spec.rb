require 'rails_helper'

RSpec.describe Api::V1::AnswersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      question = create(:question)
      create_list(:answer, 5, question: question)
      get :index
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data.length).to eq(5)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      question = create(:question)
      new_answer = build(:answer, question: question)
      post :create, params: {
        answer: {
          letter: new_answer.letter,
          text: new_answer.text,
          question_id: question.id
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/answers\/\d$/)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['text']).to eq(new_answer.text)
      expect(parsed_data['letter']).to eq(new_answer.letter)
      expect(parsed_data['question_id']).to eq(question.id)
    end

    it 'responds with errors' do
      post :create, params: {
        answer: {
          letter: '',
          text: '',
          question_id: ''
        }
      }
      expect(response.status).to eq(422)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['errors']).not_to be_empty
    end
  end

  describe 'PUT #update' do
    it 'responds successfully' do
      answer = create(:answer)
      new_text = 'test test test'
      put :update, params: {
        id: answer.id,
        answer: {
          text: new_text
        }
      }
      expect(response).to have_http_status(:success)
      parsed_data = JSON.parse(response.body)
      expect(parsed_data['text']).to eq(new_text)
    end

    it 'responds with errors' do
      answer = create(:answer)
      put :update, params: {
        id: answer.id,
        answer: {
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
      answer = create(:answer)
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
      answer = create(:answer)
      delete :destroy, params: { id: answer.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns http not found if missing' do
      delete :destroy, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
