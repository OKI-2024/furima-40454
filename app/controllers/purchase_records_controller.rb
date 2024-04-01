class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]

def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  if @item.purchase_record.nil? && @item.user != current_user
     @purchase_record_destination = PurchaseRecordDestination.new
  else
     redirect_to root_path
  end
end


def create
  @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_destination_params)
  if @purchase_record_destination.valid?
     pay_item
     @purchase_record_destination.save
     redirect_to root_path
  else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render action: :index, status: :unprocessable_entity
  end
end

private


def purchase_record_destination_params
  params.require(:purchase_record_destination).permit(:postal_code, :region_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_destination_params[:token],
      currency: 'jpy'                 
    )
end

def set_item
  @item = Item.find(params[:item_id])
end



end