FactoryBot.define do
  factory :trail do
    sequence(:length) { |n| n + 5}
    sequence(:name) { |n| "Trail #{n}" }
    sequence(:address) { |n| "#{n} Sample Street"}
  end

  factory :trip do
    sequence(:name) { |n| "Trip #{n}" }
  end

end
