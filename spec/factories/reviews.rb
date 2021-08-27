FactoryBot.define do
  factory :review do
    title {'これは最高のイヤホンだ！'}
    point {10}
    text  {'音質・ノイキャン・外音取り込みに加えて、ケースサイズなどの細かいところまで文句無しの最高の一品！'}
    association :user
    association :item
  end
end
