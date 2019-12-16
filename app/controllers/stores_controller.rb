class StoresController < ApplicationController
  include StoresHelper
  skip_before_action :verify_authenticity_token

  before_action :load_combos, only: %i(show)
  before_action :load_products, only: %i(show)

  def show; 
    @store = Store.find_by id: params[:id]
  end
  
  def detail_page
    @store = Store.find_by id: params[:store_id]
    @comments = Store.find_by(id: params[:store_id]).comments
    @images = @store.images.image
  end

  def create_comment
    @comment = Comment.new comment_params
    if @comment.food.nil?
      @comment.food = 0
    end
    if @comment.price.nil?
      @comment.price = 0
    end
    if @comment.punctuality.nil?
      @comment.punctuality = 0
    end
    if @comment.courtesy.nil?
      @comment.courtesy = 0
    end
    if @comment.save
      flash[:success] = t(".success")
    else
      flash[:danger] = t(".error")
    end
    redirect_to  store_detail_page_path
  end


  def submit_store
    if !user_signed_in? 
      redirect_to root_path
      return
    end
    @store = Store.new store_params
    if @store.save
      current_user.update_attributes(role: 1)
      flash[:success] = t(".success")
      redirect_to root_path
    else
      puts @store.errors.full_messages
      flash[:danger] = t(".error")
      redirect_to submit_store_path
    end
  end

  private

  def store_params
    params.require(:store).permit :name, :address, :phone, :user_id, :vip
  end

  def load_combos
    @combos = Combo.by_store_id(params[:id]).take Settings.num_in_web
  end

  def load_products
    @products = Product.by_store_id(params[:id]).take Settings.num_in_web
  end

  def comment_params
    params.require(:comment).permit :user_id, :commentable_type, :commentable_id, :content, :food, :price, :punctuality, :courtesy
  end

end
