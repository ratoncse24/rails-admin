# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "Phone", status: 1, description: "All phone")
Category.create(name: "Mac", status: 1, description: "All mac")

Product.create(item_code: "abcd", item_name: "iPhone 6", item_status: 1, item_short_description: "Short description ",
               item_long_description: "Long description", category_id: 1, item_images: 'na', item_price: 10000  )

Product.create(item_code: "ffff", item_name: "Mac", item_status: 1, item_short_description: "Short description ",
               item_long_description: "Long description", category_id: 2, item_images: 'na', item_price: 100000  )