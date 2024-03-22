class ItemsController < ApplicationController

def index
end

def new
end







private

def item_params
  params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :region_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
end


end
