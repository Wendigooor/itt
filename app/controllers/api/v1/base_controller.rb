class Api::V1::BaseController < ApplicationController

  def error_response(errors)
    render json: { errors: errors }, status: 422
  end

end
