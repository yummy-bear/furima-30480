class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_new_session, only: :new

  def index
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
  end
  
  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_new_session
    redirevt_to 'new_user_session_path' unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :status_id, :category_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end


