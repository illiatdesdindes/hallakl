class ProductsController < ApplicationController
  
  def new
    @product = current_user.shops.first.products.build
  end
  
  
  
  def create
    @product = current_user.shops.first.products.build(params[:product])
    
    if @product.save
      flash[:success] = "Produit Ajout&eacute"
      redirect_to current_user.shops.first
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "#{@product.name} a &eacute;t&eacute; modifi&eacute;"
      redirect_to @product.shop
    else
      render 'edit'
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:info] = "Le produit a &eacute;t&eacute; supprim&eacute;"
    redirect_to current_user.shops.first
  end
end
