class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders

  validates_presence_of :value, :imei, :device
end
