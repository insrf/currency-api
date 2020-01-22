class Api::V1::CurenciesController < ApplicationController
  def index
    @curencies = Curency.all
    render json: @curencies
  end

  def show
    @curency = Curency.find(params[:id])
    render json: @curency
  end
end
