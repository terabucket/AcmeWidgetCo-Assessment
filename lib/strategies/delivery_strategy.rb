# Base interface for calculating delivery costs
class DeliveryStrategy
  def calculate(subtotal)
    # Return the delivery cost for the given subtotal
    raise NotImplementedError, 'Subclasses must implement the calculate method'
  end
end