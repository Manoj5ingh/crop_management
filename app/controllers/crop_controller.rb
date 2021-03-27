require 'inventory/manager.rb'
class CropController < ApplicationController
  def create
    helper = Inventory::Manager.get_storage_helper
    response = helper.insert(params[:state], params[:dist], params[:mandi], params[:crop], params[:variety], params[:date], params[:price])
    render :body => response.to_json, :status => 200
  end

  def get_latest
    helper = Inventory::Manager.get_storage_helper
    response = helper.latest_price_by_state_dist_crop(params[:state], params[:dist], params[:crop])
    render :body => response.to_json, :status => 200
  end

  def get_limited_result
    helper = Inventory::Manager.get_storage_helper
    response = helper.limited_result(params[:state], params[:dist], params[:mandi], params[:crop], params[:variety], params[:points].to_i, params[:days].to_i)
    render :body => response.to_json, :status => 200
  end
end