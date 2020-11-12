FactoryBot.define do
  factory :comment do
    text {'あいうえお'}


    association :user
    association :item
    
  end
end
