class PurchaseRecordsController < ApplicationController

def index
  @purchase_record = PurchaseRecord.new
end

def create
  @purchase_record = PurchaseRecord.new(purchase_record_params)
  if @purchase_record.valid?
     @purchase_record.save
     return redirect_to root_path
  else
    render 'index', status: :unprocessable_entity
  end
end






end
