FactoryBot.define do
  factory :movie do
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
  end
end