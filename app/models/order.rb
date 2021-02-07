class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders

  validates_presence_of :imei, :device
  validates :value, presence: true, numericality: { greater_than: 0 }

  def formatted_value
    ActiveSupport::NumberHelper.number_to_currency(value, unit: "R$ ", delimiter: ".", separator: "," )
  end
end
