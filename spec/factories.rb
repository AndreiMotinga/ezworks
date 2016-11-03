FactoryGirl.define do
  factory :article do
    title { FFaker::Lorem.sentence }
    text { FFaker::Lorem.paragraph(5) }
  end
end
