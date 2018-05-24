class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Cheque","Debit Card", "Credit Card", "Purchase Order" ]
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
