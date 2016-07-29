# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
shop = Shop.create(name: 'bar')
10.times do |i|
  c = Category.create(name: "name-#{i}", shop: shop)
  5.times do |j|
    c.products.create(name: "name-#{i}-#{j}", price: i * 100, stock: j + 3*i)
  end
end
