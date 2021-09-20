FactoryBot.define do
  factory :event do
    association :user
    title { "Событие_#{rand(999)}" }
    address { "Город #{rand(999)}" }
    datetime { Time.now + rand(10).days }
  end
end
