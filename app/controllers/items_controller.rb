class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render :edit
    elsif user_signed_in? && @item.user != current_user
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :category_id,
                                 :status_id,
                                 :delivery_charge_id,
                                 :region_id,
                                 :days_up_to_delivery_id,
                                 :price,
                                 :image).merge(user_id: current_user.id)
  end
end
