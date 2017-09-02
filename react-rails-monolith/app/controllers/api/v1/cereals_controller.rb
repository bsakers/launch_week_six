class Api::V1::CerealsController < ApplicationController
  def index
    cereals = Cereal.all
    render json: cereals
  end

  def show
    cereal = Cereal.find(params[:id])
    render json: cereal
  end
end
