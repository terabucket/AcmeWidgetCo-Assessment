class Catalog
  def initialize(products = [])
    @products = {}
    products.each do |product|
      @products[product.code] = product
    end
  end

  def find_product(product_code)
    @products[product_code]
  end
end