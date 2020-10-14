class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :deli_char_id, :ship_from_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end
