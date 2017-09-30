require 'rails_helper'

RSpec.describe Api::V1::AnswersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      question = create(:question)
      create_list(:answer, 5, question: question)
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_collection_response_for('answers')
    end
  end

  describe "POST #create" do
    it "responds successfully" do
      question = create(:question)
      new_answer = build(:answer, question: question)
      post :create, {
        params: {
          data: {
            type: 'answers',
            attributes: {
              letter: new_answer.letter,
              text: new_answer.text,
              question_id: question.id
            }
          }
        }
      }
      expect(response.status).to eq(201)
      expect(response.headers['Location']).to match(/\/answers\/\d$/)
      expect(response.body).to be_jsonapi_response_for('answers')
    end

    it "responds with errors" do
      post :create, {
        params: {
          data: {
            type: 'answers',
            attributes: {}
          }
        }
      }
      expect(response.status).to eq(422)
      expect(response.body).to have_jsonapi_errors_for('/data/attributes/text')
    end
  end

  describe "PUT #update" do
    it "responds successfully" do
      answer = create(:answer)
      new_text = "test test test"
      put :update, {
        params: {
          id: answer.id,
          data: {
            type: 'answers',
            attributes: {
              text: new_text
            }
          }
        }
      }
      expect(response).to have_http_status(:success)
      expect(response.body).to be_jsonapi_response_for('answers')
      parsed = JSON.parse(response.body)
      expect(parsed.dig('data', 'attributes', 'text')).to eq(new_text)
    end

    it "responds with errors" do
      answer = create(:answer)
      put :update, {
        params: {
          id: answer.id,
          data: {
            type: 'answers',
            attributes: {
              text: ''
            }
          }
        }
      }
      expect(response.status).to eq(422)
      expect(response.body).to have_jsonapi_errors_for('/data/attributes/text')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      answer = create(:answer)
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
      answer = create(:answer)
      delete :destroy, params: { id: answer.id }
      expect(response).to have_http_status(:success)
    end

    it "returns http not found if missing" do
      delete :destroy, params: { id: 12345 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
