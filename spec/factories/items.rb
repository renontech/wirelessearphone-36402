FactoryBot.define do
  factory :item do
    name    {'earphone'}
    maker   {'company'}
    price   {29800}
    sound   {'good'}
    anc     {'strong'}
    ambient {'comfortable'}
    type    {'canal'}
    size    {'height: 5cm, width: 2.5cm, thickness: 1.8cm'}
    codec   {'SBC, AAC, aptX'}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/wf1000xm4.jpg'), filename: 'wf1000xm4.jpg')
    end
  end
end
