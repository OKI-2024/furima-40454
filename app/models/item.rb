class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :days_up_to_delivery
  






end
