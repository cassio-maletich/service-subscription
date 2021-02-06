class Order < ApplicationRecord
  belongs_to :user

  validates_presence_of :value, :imei, :device
end
