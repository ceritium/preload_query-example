class Category < ApplicationRecord
  has_many :products
  belongs_to :shop

  def self.products_count(ids)
    where(id: ids).group("categories.id").joins(:products).select("categories.id, count(products.id) AS products_count")
  end

  def self.sum_price(ids)
    where(id: ids).group("categories.id").joins(:products).select("categories.id, sum(products.price) AS sum_price")
  end

end
