FactoryBot.define do

  factory :product do
    name              {"nozomi"}
    description       {"おいしい"}
    status            {"新品、未使用"}
    send_fee          {"送料込み（出品者負担）"}
    region_id         {"1"}
    send_day          {"１〜２日で発送"}
    price             {"500"}
  end

end