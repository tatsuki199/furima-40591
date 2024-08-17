class ItemsController < ApplicationController
before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :situation_id, :load_id, :region_id, :delivery_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id 
      redirect_to action: :index
    end
  end

end
