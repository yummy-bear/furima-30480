class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_current_user, only: [:edit, :update]
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all.order(id: 'DESC')
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def ensure_current_user
    item = Item.find(params[:id])
    redirect_to action: :index if item.user_id != current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :status_id, :category_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
