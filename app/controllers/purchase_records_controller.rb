class PurchaseRecordsController < ApplicationController

def index
  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  @purchase_record = PurchaseRecord.new
  @item = Item.find(params[:item_id])
  
end

def create
  @purchase_record = PurchaseRecord.new(purchase_record_params)
  if @purchase_record.valid?
     pay_item
     @purchase_record.save
     return redirect_to root_path
  else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render 'index', status: :unprocessable_entity
  end
end


private

  def purchase_record_params
    params.require(:purchase_record).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_records[:price],
      card: purchase_record[:token],
      currency: 'jpy'                 
    )
  end

end
