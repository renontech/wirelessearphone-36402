FactoryBot.define do
  factory :user do
    nickname  { 'test12.-@テスト' }
    email     { Faker::Internet.free_email }
    password  { '123abc' }
    password_confirmation {password}
  end
end