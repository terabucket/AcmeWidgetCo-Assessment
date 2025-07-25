require 'rspec'
require_relative '../lib/basket'
require_relative '../lib/product'
require_relative '../lib/catalog'
require_relative '../lib/strategies/buy_one_get_one_half_price'
require_relative '../lib/strategies/tiered_delivery_pricing'

RSpec.describe Basket do
  let(:red_widget)   { Product.new(code: 'R01', name: 'Red Widget',   price: 32.95) }
  let(:green_widget) { Product.new(code: 'G01', name: 'Green Widget', price: 24.95) }
  let(:blue_widget)  { Product.new(code: 'B01', name: 'Blue Widget',  price: 7.95) }

  let(:catalog) { Catalog.new([red_widget, green_widget, blue_widget]) }
  let(:offer_strategy) { BuyOneGetOneHalfPrice.new }
  let(:delivery_strategy) { TieredDeliveryPricing.new }

  subject { described_class.new(catalog: catalog, 
                                offer_strategy: offer_strategy,
                                delivery_strategy: delivery_strategy) }

  context "example test" do
    it "calculates the first example" do
      subject.add('B01')
      subject.add('G01')
      expect(subject.total).to eq(37.85)
    end

    it "calculates the second example" do
      subject.add('R01')
      subject.add('R01')
      expect(subject.total).to eq(54.37)
    end
  end
end