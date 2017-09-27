class Api::V1::ExamsController < ApiController

  def index
    if params[:user_id]
      @exams = Exam.where(user_id: params[:user_id]).all
    else
      @exams = Exam.all
    end
    render json: @exams
  end

  def create
    @exam = Exam.new(exam_attributes)
    if @exam.save
      render json: @exam,
             status: :created,
             location: "/api/v1/exams/#{@exam.id}"
    else
      respond_with_errors(@exam)
    end
  end

  def update
    @exam = Exam.where(id: params[:id]).first
    if @exam
      if @exam.update_attributes(exam_attributes)
        render json: @exam,
               location: "/api/v1/exams/#{@exam.id}"
      else
        respond_with_errors(@exam)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @exam = Exam.where(id: params[:id]).first
    if @exam
      render json: @exam, location: "/api/v1/exams/#{@exam.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @exam = Exam.where(id: params[:id]).first
    if @exam
      @exam.destroy
      render json: @exam
    else
      render json: {}, status: :not_found
    end
  end

  private
  def exam_params
    params.require(:data).permit(:type, {
      attributes: [:title, :user_id]
      })
  end

  def exam_attributes
    exam_params[:attributes] || {}
  end
end
