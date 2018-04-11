class ApiController < ApplicationController

  def search
    @tags = Gutentag::Tag.where(name: search_params['search'])
    render json: @tags
  end

  private
  def search_params
    params.permit([:search])
  end
end
