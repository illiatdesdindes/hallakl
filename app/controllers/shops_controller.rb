class ShopsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = current_user.shops.build(params[:shop])
    if @shop.save
      flash[:success] = "Votre Etablissement est maintentant en ligne"
      redirect_to @shop
    else
      render 'new'
    end
  end
  
  def edit 
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      flash[:success] = "Modifications enregistrees"
      redirect_to @shop
    else
      render 'edit'
    end
  end
  
  private
  
    def correct_user
      @shop = current_user.shops.find_by_id(params[:id])
      redirect_to root_path if @shop.nil?
    end
end
