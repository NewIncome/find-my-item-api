FactoryBot.define do
  factory :favorites_list do
    user_id { 1 }
    item_id { Faker::Number.number(10) }
    user_item { user_id.to_s + item_id.to_s }
  end
end
