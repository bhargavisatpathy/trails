class Api::V1::TrailsController < ApplicationController
  def index
    trails = Trail.where(state: params[:state]).limit(30)

    render json: trails, each_serializer: TrailSerializer
  end

  def show
    trail = Trail.find(params[:id])

    render json: trail, serializer: TrailSerializer
  end

  def search
    if params[:state]
      trails = Trail.filter_by_state(params[:state])
    elsif params[:lat] && params[:lng]
      trails = Trail.filter_by_lat_lng(params[:lat].to_f, params[:lng].to_f)
    end
    render json: trails, each_serializer: TrailSerializer
  end
end
