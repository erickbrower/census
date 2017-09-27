class Api::V1::SittingsController < ApiController
  def index
    if params[:user_id]
      @sittings = Sitting.where(user_id: params[:user_id]).all
    elsif params[:exam_id]
      @sittings = Sitting.where(exam_id: params[:exam_id]).all
    else
      @sittings = Sitting.all
    end
    render json: @sittings
  end

  def create
    @sitting = Sitting.new(sitting_attributes)
    if @sitting.save
      render json: @sitting,
             status: :created,
             location: "/api/v1/sittings/#{@sitting.id}"
    else
      respond_with_errors(@sitting)
    end
  end

  def update
    @sitting = Sitting.where(id: params[:id]).first
    if @sitting
      if @sitting.update_attributes(sitting_attributes)
        render json: @sitting,
               location: "/api/v1/sittings/#{@sitting.id}"
      else
        respond_with_errors(@sitting)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @sitting = Sitting.where(id: params[:id]).first
    if @sitting
      render json: @sitting, location: "/api/v1/sittings/#{@sitting.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @sitting = Sitting.where(id: params[:id]).first
    if @sitting
      @sitting.destroy
      render json: @sitting
    else
      render json: {}, status: :not_found
    end
  end

  private
  def sitting_params
    params.require(:data).permit(:type, {
      attributes: [:exam_id, :user_id, :score]
      })
  end

  def sitting_attributes
    sitting_params[:attributes] || {}
  end
end
