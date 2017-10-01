class Api::V1::SittingsController < ApiController
  def index
    @sittings = if params[:user_id]
                  Sitting.where(user_id: params[:user_id]).all
                elsif params[:exam_id]
                  Sitting.where(exam_id: params[:exam_id]).all
                else
                  Sitting.all
                end
    render json: @sittings
  end

  def create
    @sitting = Sitting.new(sitting_params)
    if @sitting.save
      render json: @sitting,
             status: :created,
             location: location(@sitting.id)
    else
      respond_with_errors(@sitting)
    end
  end

  def update
    @sitting = Sitting.where(id: params[:id]).first
    if @sitting
      if @sitting.update_attributes(sitting_params)
        render json: @sitting,
               location: location(@sitting.id)
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
    params.require(:sitting).permit(:exam_id, :user_id, :score)
  end

  def location(id)
    "/api/v1/sittings/#{id}"
  end
end
