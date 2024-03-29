class Destination < ApplicationRecord
  
  belongs_to :purchase_record
  #belongs_to :region


  #validates :postal_code, presence: true,  presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #validates :region_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  #validates :city, presence: true
  #validates :block, presence: true
  #validates :phone_number, presence: true
end
