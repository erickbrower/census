class Api::V1::QuestionsController < ApiController
  def index
    @questions = if params[:exam_id]
                   Question
                     .where(exam_id: params[:exam_id])
                     .order(:number)
                     .all
                 else
                   Question.all
                 end
    render json: @questions
  end

  def create
    @question = Question.new(question_params)
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
      if @question.update_attributes(question_params)
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
    params.require(:question).permit(:text, :exam_id)
  end
end
