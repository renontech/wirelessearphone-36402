FactoryBot.define do
  factory :user do
    nickname  { 'test12.-@ใในใ' }
    email     { Faker::Internet.free_email }
    password  { '123abc' }
    password_confirmation {password}
  end
end