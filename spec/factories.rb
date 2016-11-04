FactoryGirl.define do
  factory :article do
    title { FFaker::Lorem.sentence }
    text { FFaker::Lorem.paragraph(5) }
  end

  factory :user do
    email { FFaker::Internet.email }
    password FFaker::Internet.password
  end
end
