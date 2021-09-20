FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User_#{n}" }
    sequence(:email) { |n| "email_#{n}@rubynium.ru" }
    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
