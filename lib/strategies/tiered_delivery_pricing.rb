require 'bigdecimal'
require 'bigdecimal/util'
require_relative 'delivery_strategy'

# Tiered delivery rules:
# * Orders under $50 cost $4.95
# * Orders under $90 cost $2.95
# * Orders of $90 or more have free delivery
class TieredDeliveryPricing < DeliveryStrategy
  def calculate(subtotal)
    return 0.to_d   if subtotal >= 90.to_d
    return 2.95.to_d if subtotal >= 50.to_d
    4.95.to_d
  end
end