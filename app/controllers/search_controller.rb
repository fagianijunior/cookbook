class SearchController < ApplicationController
  def index
    if params[:q]
      @users = User.where("first_name like ? or last_name like ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @users = User.all.order('created_at DESC')
    end
  end
end
