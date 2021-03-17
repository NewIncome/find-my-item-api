FactoryBot.define do
  factory :favorites_list do
    user_id { 1 }
    item_id { Faker::Number.number(10) }
    user_item { this.user_id.to_s + this.item_id.to_s }
  end
end
