class SearchController < ApplicationController
  def index
    #if params[:q]
    @users = User.where("first_name like ? or last_name like ?", "%#{params[:q]}%", "%#{params[:q]}%") || []
  end
end