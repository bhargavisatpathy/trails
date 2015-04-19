class Api::V1::PlantsController < ApplicationController
  def index
    plants = Species.where(trail_id: params[:trail_id]).where(kingdom: "Plantae")

    render json: plants, each_serializer: PlantsSerializer
  end
end
