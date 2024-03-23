class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
    
  belongs_to :user
  has_one :purchase_record
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :days_up_to_delivery
  has_one_attached :image
  
  validates :name,
            :description,
            :category_id,
            :status_id,
            :delivery_charge_id,
            :region_id,
            :days_up_to_delivery_id,
            :price,
            presence: true,
            numericality: { other_than: 1 , message: "can't be blank"}


end
