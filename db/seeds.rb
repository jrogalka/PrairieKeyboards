require "faker"
require "json"

# AdminUser.delete_all
Product.delete_all

# USED TO GENERATE 10 INITIAL SAFE PRODUCTS

file = File.read("./public/data.json")
data = JSON.parse(file)
i = 0

10.times do
  product = Product.new
  product.name = data[i]["name"]
  product.sku = data[i]["sku"]
  product.description = data[i]["description"]
  product.price = data[i]["price"]
  product.is_assembled = data[i]["is_assembled"]
  product.category = Category.find(data[i]["category_id"])

  if product&.valid?
    puts "Created #{product.name}"
    product.save
  else
    product.errors.each { |attr, msg| puts "#{attr} - #{msg}\n" }
  end

  i += 1
end

# Generate 100 temporary products
100.times do
  category = Category.find(rand(1..4))

  product = category.products.create(
    name:         Faker::Computer.stack + Faker::Computer.type,
    sku:          Faker::Number.number(digits: 10),
    description:  Faker::Coffee.notes,
    price:        Faker::Number.between(from: 100, to: 3000),
    is_assembled: Faker::Boolean.boolean
  )
  if product&.valid?
    puts "Created #{product.name}"
    product.save
  else
    product.errors.each { |attr, msg| puts "#{attr} - #{msg}\n" }
  end
end

# if Rails.env.development?
#   AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
# end
