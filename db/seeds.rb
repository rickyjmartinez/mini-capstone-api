# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
product = Product.new(name: "starter set", price: 20, image_url: "https://i5.walmartimages.com/seo/Dungeons-Dragons-Starter-Set-Book-Supplement_d48f4511-173f-4d3f-9f79-a7636dbf3d8f_1.64ad6f13280fcc303930bcf152118346.jpeg", description: "a kit to get started in dnd.")
product.save
