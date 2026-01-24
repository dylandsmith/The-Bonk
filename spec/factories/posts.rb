# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end

  # factory :post do
  #   title{ Faker::Lorem.sentence }
  #   body { Faker::Lorem.paragraph }
  #   association :user
  # end
end


