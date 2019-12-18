class HomePagesController < ApplicationController
  include StoresHelper

  def index
    @stores = Store.all.order(vip: :desc).where('vip > 1').limit(6)
  end
  
  def submit_store
    if !user_signed_in? 
      redirect_to root_path
      return
    end
  end

  def search_store
    @param = params[:store][:keyword]
    @stores = Store.joins(:products).order(vip: :desc).where('stores.name LIKE ? or stores.address LIKE ? or products.name LIKE ?', "%#{@param}%", "%#{@param}%", "%#{@param}%").group(:id)
    render "home_pages/search"
  end
end
