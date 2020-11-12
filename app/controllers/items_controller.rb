class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_current_user
    redirect_to action: :index if @item.user_id != current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :status_id, :category_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
