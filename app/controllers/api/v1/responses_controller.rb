class Api::V1::ResponsesController < ApiController
  def index
    @responses = if params[:sitting_id]
                   Response.where(sitting_id: params[:sitting_id]).all
                 else
                   Response.all
                 end
    render json: @responses
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      render json: @response,
             status: :created,
             location: location(@response.id)
    else
      respond_with_errors(@response)
    end
  end

  def update
    @response = Response.where(id: params[:id]).first
    if @response
      if @response.update_attributes(response_params)
        render json: @response,
               location: location(@response.id)
      else
        respond_with_errors(@response)
      end
    else
      render json: {}, status: :not_found
    end
  end

  def show
    @response = Response.where(id: params[:id]).first
    if @response
      render json: @response, location: location(@response.id)
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
    params.require(:response).permit(:sitting_id, :question_id, :answer_id)
  end

  def location(id)
    "/api/v1/responses/#{id}"
  end
end
