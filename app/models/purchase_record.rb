class PurchaseRecord < ApplicationRecord
  belongs_to :item
  belongs_to :user
  #belongs_to :region
  has_one :destination


  attr_accessor :token

end
