FactoryBot.define do
  factory :user_purchase do
    postal_code { '444-4444' }
    prefecture { 1 }
    city { '横浜市緑区' }
    house_number { '青山1-1' }
    tel { '09011111234' }
    token { 'token_sample' }
  end
end
