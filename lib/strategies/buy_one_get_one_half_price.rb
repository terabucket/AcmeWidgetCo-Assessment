require 'bigdecimal'
require 'bigdecimal/util'
require_relative 'offer_strategy'

# Example offer: "Buy one red widget (R01), get the second one half price."
class BuyOneGetOneHalfPrice < OfferStrategy
  DISCOUNTED_CODE = 'R01'

  def apply(items)
    relevant_items = items.select { |p| p.code == DISCOUNTED_CODE }
    other_items    = items.reject { |p| p.code == DISCOUNTED_CODE }

    r01_count = relevant_items.size
    return sum_items(items) if r01_count.zero?

    half_price_pairs = (r01_count / 2)
    r01_price = relevant_items.first.price

    cost_for_full = r01_price * r01_count.to_d
    discount = r01_price / 2 * half_price_pairs.to_d

    cost_for_r01 = cost_for_full - discount

    cost_of_others = sum_items(other_items)

    cost_for_r01 + cost_of_others
  end

  private

  def sum_items(items)
    items.reduce(0.to_d) { |sum, product| sum + product.price }
  end
end
