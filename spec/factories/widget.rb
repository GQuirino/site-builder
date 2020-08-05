FactoryBot.define do
  factory :widget do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    background_color { Faker::Color.hex_color }

    association :site
  end
end
