FactoryBot.define do
  factory :item do
    name    {'earphone'}
    maker   {'company'}
    price   {29800}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/wf1000xm4.jpg'), filename: 'wf1000xm4.jpg')
    end
  end
end
