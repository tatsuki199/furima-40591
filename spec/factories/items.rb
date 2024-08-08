FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {rand(2..11)}
    situation_id {rand(2..7)}
    load_id {rand(2..3)}
    region_id {rand(2..48)}
    delivery_id {rand(2..4)}
    selling_price {rand(300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
