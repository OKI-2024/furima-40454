class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/ , message: "is invalid."}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

    validates :user_id
    validates :item_id
    
    validates :token
    end
    
    
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end

end