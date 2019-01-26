FactoryBot.define do
  factory :depreciation do
    note { "MyString" }
    amount { 1 }
    quantity { 1 }
    provider { nil }
    material { nil }
    user { nil }
  end
end
