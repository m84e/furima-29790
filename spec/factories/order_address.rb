FactoryBot.define do
  factory :order_address do
    postal_code{"123-4567"}
    prefectures_id {2}
    city{"横浜市"}
    house_num{"青山1-1-1"}
    phone_num{"09012345678"}
    token{"abc_12345"}
  end
end