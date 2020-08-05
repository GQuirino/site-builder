FactoryBot.define do
  factory :banner do
    title_color { Faker::Color.hex_color }
    background_color { Faker::Color.hex_color }

    association :site
  end
end
