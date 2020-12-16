FactoryBot.define do
  factory :address do
    id {1}
    post_code     {"111-1111"}
    prefecture_id {"北海道"}
    city          {"札幌市"}
    house_number  {"青葉区1-1-1"}
  end
end