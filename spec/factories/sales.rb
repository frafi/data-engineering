FactoryGirl.define do
  factory :sale do
    purchaser_name "Mike Smith"
    quantity 4
    association :item, factory: :item
    association :merchant, factory: :merchant
  end
end