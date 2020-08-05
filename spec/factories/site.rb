FactoryBot.define do
  factory :site do
    title { Faker::Name }
    icon { Faker::Internet.url }
    background_color { Faker::Color.hex_color }

    trait :with_banner do
      after(:stub) do |site|
        site.banner = build_stubbed(:banner, site: site)
      end
    end
  end
end
