require 'bigdecimal'
require 'bigdecimal/util'
require_relative 'product'
require_relative 'catalog'
require_relative 'strategies/offer_strategy'
require_relative 'strategies/delivery_strategy'

class Basket
  def initialize(catalog:, offer_strategy:, delivery_strategy:)
    @catalog = catalog
    @offer_strategy = offer_strategy
    @delivery_strategy = delivery_strategy
    @items = []
  end

  def add(product_code)
    product = @catalog.find_product(product_code)
    raise "Product with code '#{product_code}' not found in catalog" unless product

    @items << product
  end

  def total
    subtotal = @offer_strategy.apply(@items)

    delivery_cost = @delivery_strategy.calculate(subtotal)

    grand_total = (subtotal + delivery_cost).truncate(2)

    grand_total.to_f
  end
end
