# Base interface for applying special offers on a basket.
require 'bigdecimal'
require 'bigdecimal/util'

class OfferStrategy
  def apply(items)
    # 'items' is an array of Product objects
    # Return a BigDecimal representing the discounted price
    raise NotImplementedError, 'Subclasses must implement the apply method'
  end
end