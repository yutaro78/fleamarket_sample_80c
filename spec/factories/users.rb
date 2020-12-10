FactoryBot.define do

  factory :user do
    id {1}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"aaaaaaaa"}
    password_confirmation {"aaaaaaaa"}
    firstname             {"阿部"}
    lastname              {"太郎"}
    firstname_kana        {"アベ"}
    lastname_kana         {"タロウ"}
    birth                 {"19900101"}
  end
end