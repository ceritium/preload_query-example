require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  setup do
    Product.delete_all
    Category.delete_all
    Shop.delete_all

    shop = Shop.create(name: 'shop')

    10.times do |i|
      c = shop.categories.create(name: "name-#{i}")
      5.times do |j|
        c.products.create(name: "name-#{i}-#{j}", price: i * 100, stock: j + 3*i)
      end
    end
  end

  test "preload_queries without relation" do
    assert_equal [0, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500],
      Category.all.preload_query(:sum_price).map(&:sum_price)
  end

  test "preload_queries with relation" do
    assert_equal [0, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500],
      Shop.first.categories.preload_query(:sum_price).map(&:sum_price)
  end
end
