class Api::V1::TrailsController < ApplicationController
  respond_to :json

  def index
    @trails = Trail.paginate(:page => params[:page], :per_page => 30)

    respond_with @trails
  end

  def show
    @trail = Trail.find(params[:id])

    respond_with @trail
  end
end
