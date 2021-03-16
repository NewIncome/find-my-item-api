FactoryBot.define do
  factory :favorites_list do
    user_id { 1 }
    item_id { Faker::Number.number(10) }
    user_item { "#{this.user_id}" + "#{this.item_id}" }
  end
end
