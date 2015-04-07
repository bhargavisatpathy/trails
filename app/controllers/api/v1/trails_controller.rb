class Api::V1::TrailsController < ApplicationController
  respond_to :json

  def index
    @trails = Trail.all

    respond_with @trails
  end

  def show

  end
end
