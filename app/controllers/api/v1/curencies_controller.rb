class Api::V1::CurenciesController < ApplicationController
  before_action :find_curency, only: %i[show]

  def index
    @curencies = Curency.all
    paginate json: @curencies, per_page: 10
  end

  def show
    render json: @curency
  end

  private

  def find_curency
    @curency = Curency.find(params[:id])
  end
end
