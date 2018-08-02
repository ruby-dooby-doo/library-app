# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = Unirest.get("https://www.bklynlibrary.org/learning-resources/json")

learning_resources = response.body

array_of_learning_resources = learning_resources['nodes']

array_of_learning_resources.each do |learning_resource|
  p "*" * 50
  p learning_resource['node']['title']
  p learning_resource['node']['description']
  p learning_resource['node']['link']
  p "*" * 50
  medium = Medium.new(
    title: learning_resource['node']['title'],
    description: learning_resource['node']['description'],
    link: learning_resource['node']['link']
  )
  medium.save
end


