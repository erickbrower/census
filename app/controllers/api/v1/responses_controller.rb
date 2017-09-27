class Api::V1::ResponsesController < ApiController

  def index
    if params[:sitting_id]
      @responses = Response.where(sitting_id: params[:sitting_id]).all
    else
      @responses = Response.all
    end
    render json: @responses
  end

  def create
    @response = Response.new(response_attributes)
    if @response.save
      render json: @response,
             status: :created,
             location: "/api/v1/responses/#{@response.id}"
    else
      respond_with_errors(@response)
    end
  end

  def show
    @response = Response.where(id: params[:id]).first
    if @response
      render json: @response, location: "/api/v1/responses/#{@response.id}"
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    @response = Response.where(id: params[:id]).first
    if @response
      @response.destroy
      render json: @response
    else
      render json: {}, status: :not_found
    end
  end

  private
  def response_params
    params.require(:data).permit(:type, {
      attributes: [:sitting_id, :question_id, :answer_id]
      })
  end

  def response_attributes
    response_params[:attributes] || {}
  end
end
