FactoryBot.define do 
  factory :item do
    rand_introduction = 1000.times.inject("") { |str| str.concat([*"ぁ".."ん"].sample) }
    rand_price = Random.rand( 300 .. 9999999 )
    rand_condition_id = Random.rand( 1 .. 6 )
    rand_size_id = Random.rand( 1 .. 51 )
    rand_prefecture_id = Random.rand( 1 .. 47 )
    rand_shipping_cost_id = Random.rand( 1 .. 2 )
    rand_shipping_days_id = Random.rand( 1 .. 6 )

    name              {Faker::JapaneseMedia::DragonBall.character}
    introduction      {rand_introduction}
    price             {rand_price}
    condition_id      {rand_condition_id}
    size_id           {rand_size_id}
    brand             {"グッチ"}
    prefecture_id     {rand_prefecture_id}
    shipping_cost_id  {rand_shipping_cost_id}
    shipping_days_id  {rand_shipping_days_id}
    association :user
    association :category

    after(:build) do |item|
      item.images << build(:image, item: item)  
    end    
  end
end
