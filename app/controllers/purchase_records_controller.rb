class PurchaseRecordsController < ApplicationController

def index
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  @item = Item.find(params[:item_id])
  @purchase_record_destination = PurchaseRecordDestination.new
end

def new
  @purchase_record_destination = PurchaseRecordDestination.new
end



def create
  @item = Item.find(params[:item_id])
  @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_destination_params)
  if @purchase_record_destination.valid?
     pay_item
     @purchase_record_destination.save
     redirect_to root_path
  else
    render action: :index, status: :unprocessable_entity
  end
end

  #@purchase_record = PurchaseRecord.new(purchase_record_params)
  #if @purchase_record.valid?
     #pay_item
     #@purchase_record.save
     #return redirect_to root_path
  #else
    #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    #render 'index', status: :unprocessable_entity
  #end


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


end