FactoryBot.define do
  factory :pay do
    id {1}
    user_id {1}
    customer_id {"cus_xxxxxxxxxxxxxx"}
    card_id {"car_yyyyyyyyyyyyyyy"}
    association :user
  end
end