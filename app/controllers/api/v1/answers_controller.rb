class Api::V1::AnswersController < ApiController
  def index
    if params[:question_id]
      @answers = Answer.where(question_id: params[:question_id]).all
    else
      @answers = Answer.all
    end
    render json: @answers
  end

  def create
    @answer = Answer.new(answer_attributes)
    if @answer.save
      render json: @answer,
             status: :created,
             location: "/api/v1/answers/#{@answer.id}"
    else
      respond_with_errors(@answer)
    end
  end

  def update
    @answer = Answer.where(id: params[:id]).first
    if @answer
      if @answer.update_attributes(answer_attributes)
        render json: @answer,
               location: "/api/v1/answers/#{@answer.id}"
      else
        respond_with_errors(@answer)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @answer = Answer.where(id: params[:id]).first
    if @answer
      render json: @answer, location: "/api/v1/answers/#{@answer.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @answer = Answer.where(id: params[:id]).first
    if @answer
      @answer.destroy
      render json: @answer
    else
      render json: {}, status: :not_found
    end
  end

  private
  def answer_params
    params.require(:data).permit(:type, {
      attributes: [:text, :question_id]
      })
  end

  def answer_attributes
    answer_params[:attributes] || {}
  end
end
