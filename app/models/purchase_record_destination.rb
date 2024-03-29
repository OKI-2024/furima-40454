class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :block
    validates :phone_number
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    
    validates :user_id
    validates :item_id
    
    validates :token
    end

    validate :validate_phone_number_format
    
    
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end

  private

  def validate_phone_number_format
    return if phone_number.blank? # 空の場合

    unless phone_number.match?(/\A\d+\z/) # 記号が含まれる場合
      errors.add(:phone_number, "is invalid. Input only number")
    end
    
    if phone_number.length < 10 # 10桁未満の場合
      errors.add(:phone_number, "is too short")
    end

    if phone_number.length > 12 # 12桁以上の場合
      errors.add(:phone_number, "is too long")
    end

    end
  end


end