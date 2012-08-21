class ShopsController < ApplicationController
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
end
