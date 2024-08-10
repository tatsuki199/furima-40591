class ItemsController < ApplicationController
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
    
  end

  def get
  end

  def show
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

end
