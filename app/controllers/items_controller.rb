class ItemsController < ApplicationController
  def index
    @item = Prototype.all
  end


  def new
    @items = Item.new
  end


end
