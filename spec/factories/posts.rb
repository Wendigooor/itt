FactoryGirl.define do
  factory :post do
    title FFaker::Food.fruit
    body FFaker::Food.meat
    ip FFaker::Internet.ip_v4_address
    after(:build) { |post| post.user ||= create(:user) }
  end
end
