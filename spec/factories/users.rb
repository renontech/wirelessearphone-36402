FactoryBot.define do
  factory :user do
    nickname  {'john'}
    email     {'john@mail.com'}
    password  {'123456'}
    password_confirmation {password}
  end
end