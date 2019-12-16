class OrdersController < ApplicationController
  skip_load_and_authorize_resource

  def checkout
    @address = params[:address]
    @description = params[:description]
    @bill_details = []
    if (session[:shopping_cart] != nil) && (session[:shopping_cart].any?) 
      session[:shopping_cart].each do |item|
        @bill_details << BillDetail.new(bill_detailable_type: item["bill_detailable_type"], 
          bill_detailable_id: item["bill_detailable_id"], count: item["count"])
      end
    end
  end

  def show
    @bill_details = []
    if (session[:shopping_cart] != nil) && (session[:shopping_cart].any?)
      session[:shopping_cart].each do |item|
        @bill_details << BillDetail.new(bill_detailable_type: item["bill_detailable_type"], 
          bill_detailable_id: item["bill_detailable_id"], count: item["count"])
      end
    end
  end

  def create
    if !user_signed_in? 
      redirect_to root_path
      return
    end 
    @bill_details = []
    if (session[:shopping_cart] != nil) && (session[:shopping_cart].any?)
      session[:shopping_cart].each do |item|
        @bill_details << BillDetail.new(bill_detailable_type: item["bill_detailable_type"], 
          bill_detailable_id: item["bill_detailable_id"], count: item["count"])
      end
    end

    ids = ""

    store_ids(@bill_details).each do |store_id|
      @bill = Bill.new(store_id: store_id, user_id: current_user.id, address: params[:address])
      if @bill.save
        @bill_details.each do |bill_detail|
          bill_detail.bill_id = @bill.id
          bill_detail.price = bill_detail.bill_detailable_price
          if bill_detail.bill_detailable_store_id.eql? store_id
            if bill_detail.save 
              ids += bill_detail.id.to_s + ","
            end
          end
        end
      end
    end
    session[:shopping_cart] = []
    flash[:success] = t(".order_success")
    redirect_to :controller => 'orders', :action => 'order_confirmed', ids: ids  
  end

  def order_confirmed
    ids = params[:ids]
    @bill_details = []
    if ids != nil
      idx = ids.split(',')
      idx.each do |id|
        bill = BillDetail.find(id.to_i)
        @bill_details << bill
      end
    end
  end

  def store_ids bill_details
    @bill_details.map(&:bill_detailable_store_id).uniq
  end
end