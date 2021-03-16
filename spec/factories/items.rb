FactoryBot.define do
  factory :item do
    name { Faker::Appliance.equipment }
    description { Faker::Lorem.sentences(number: 3) }
  end
end
