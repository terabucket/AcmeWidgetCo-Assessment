# Acme Widget Co - Basket Proof of Concept

This is a proof-of-concept for Acme Widget Co’s new sales system. It calculates totals for a set of products, including special offer and tiered delivery pricing.

## Features

• Add products to the basket.
• Compute total including special offers.
• Tiered delivery charges:

- Orders under $50 cost $4.95
- Orders under $90 cost $2.95
- Orders $90 or more get free delivery

• Special Offer: Buy one Red Widget (R01), get the second half price.

## Architecture and Approach

1. Data Modeling

- Product: Represents one product with code, name, and price.
- Catalog: Acts as a store of products, so we can look up products by code.

2. Strategies (Strategy Pattern)

- OfferStrategy: an interface that manipulates or calculates discounts on items.
- BuyOneGetOneHalfPrice: a concrete strategy that implements “buy one R01, get second half off.”
- DeliveryStrategy: an interface for calculating delivery costs.
- TieredDeliveryPricing: a concrete strategy that calculates tiered shipping costs.

3. Basket

- Holds references to the strategies and catalog (Dependency Injection).
- add(product_code): to add a product to the basket.
- total(): calculates subtotal via OfferStrategy, then adds delivery cost via DeliveryStrategy.

4. How to Run

• Clone or download this repository.
• Run “bundle install” if you choose to use bundler for RSpec (optional).
• Run “ruby main.rb” to see example outputs.
• Run “rspec spec” if you’d like to execute the test suite.

5. Assumptions

• The basket has only one current offer: buy one red widget, get the second half-price. Additional or different offers would require only writing a new OfferStrategy class (e.g., “Buy2Get1Free”).
• Delivery logic is likewise encapsulated in a strategy class. If you need to change the rules or add new thresholds, create or modify a new DeliveryStrategy class.
