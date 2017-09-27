class Api::V1::QuestionsController < ApiController
  def index
    if params[:user_id]
      render json: Question.where(user_id: params[:user_id]).all
    else
      render json: Question.all
    end
  end

  def create
    @question = Question.new(question_attributes)
    if @question.save
      render json: @question,
             status: :created,
             location: "/api/v1/questions/#{@question.id}"
    else
      respond_with_errors(@question)
    end
  end

  def update
    @question = Question.where(id: params[:id]).first
    if @question
      if @question.update_attributes(question_attributes)
        render json: @question,
               location: "/api/v1/questions/#{@question.id}"
      else
        respond_with_errors(@question)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @question = Question.where(id: params[:id]).first
    if @question
      render json: @question, location: "/api/v1/questions/#{@question.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @question = Question.where(id: params[:id]).first
    if @question
      @question.destroy
      render json: @question
    else
      render json: {}, status: :not_found
    end
  end

  private
  def question_params
    params.require(:data).permit(:type, {
      attributes: [:text, :exam_id]
      })
  end

  def question_attributes
    question_params[:attributes] || {}
  end
end
