# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create some Users
3.times { |i| User.create(name: "Alexo-#{i}") }

# Create some Items
15.times do
  Item.create(
    name: Faker::Appliance.equipment,
    description: Faker::Lorem.sentences(number: 3)
  )
end

def checkRepeated(user, num)
  if FavoritesList.find_by(user_item: "#{user}"+"#{num}")
    return checkRepeated(user, Random.rand(1..14))
  else
    return num
  end
end

# Create some favorite Items for the Users
3.times do |i|
  4.times do
    FavoritesList.create(
      user_id: i,
      item_id: checkRepeated(i, Random.rand(1..14))
    )
  end
end
