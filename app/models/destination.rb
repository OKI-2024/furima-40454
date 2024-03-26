class Destination < ApplicationRecord
  
  belongs_to :purchase_record
  belongs_to :region

end
