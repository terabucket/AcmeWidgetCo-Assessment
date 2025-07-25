require_relative 'lib/product'
require_relative 'lib/catalog'
require_relative 'lib/basket'
require_relative 'lib/strategies/buy_one_get_one_half_price'
require_relative 'lib/strategies/tiered_delivery_pricing'

red   = Product.new(code: 'R01', name: 'Red Widget',   price: 32.95)
green = Product.new(code: 'G01', name: 'Green Widget', price: 24.95)
blue  = Product.new(code: 'B01', name: 'Blue Widget',  price: 7.95)

catalog = Catalog.new([red, green, blue])

offer_strategy = BuyOneGetOneHalfPrice.new
delivery_strategy = TieredDeliveryPricing.new

basket = Basket.new(
  catalog: catalog,
  offer_strategy: offer_strategy,
  delivery_strategy: delivery_strategy
)

# [Example 1] B01, G01 => 37.85
basket.add('B01')
basket.add('G01')
puts "Basket 1 total: $#{basket.total}"  # => $37.85

# [Example 2] R01, R01 => 54.37
basket = Basket.new(
  catalog: catalog,
  offer_strategy: offer_strategy,
  delivery_strategy: delivery_strategy
)
basket.add('R01')
basket.add('R01')
puts "Basket 2 total: $#{basket.total}"  # => $54.37

# [Example 3] R01, G01 => 60.85
basket = Basket.new(
  catalog: catalog,
  offer_strategy: offer_strategy,
  delivery_strategy: delivery_strategy
)
basket.add('R01')
basket.add('G01')
puts "Basket 3 total: $#{basket.total}"  # => $60.85

# [Example 4] B01, B01, R01, R01, R01 => 98.27
basket = Basket.new(
  catalog: catalog,
  offer_strategy: offer_strategy,
  delivery_strategy: delivery_strategy
)
basket.add('B01')
basket.add('B01')
basket.add('R01')
basket.add('R01')
basket.add('R01')
puts "Basket 4 total: $#{basket.total}"  # => $98.27