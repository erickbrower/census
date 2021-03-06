class Api::V1::ExamsController < ApiController
  def index
    @exams = if params[:user_id]
               Exam.where(user_id: params[:user_id]).all
             else
               Exam.all
             end
    render json: @exams
  end

  def create
    @exam = Exam.new(exam_params)
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
      if @exam.update_attributes(exam_params)
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
    params.require(:exam).permit(:title, :user_id)
  end
end
