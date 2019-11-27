class HomePagesController < ApplicationController
  include StoresHelper

  def index
    @stores = Store.all.limit(8)
  end


  def search_store
    @param = params[:store][:keyword]
    @stores = Store.all.where('name LIKE ? or address Like ?', "%#{@param}%", "%#{@param}%")
    render "home_pages/index"
  end
end
