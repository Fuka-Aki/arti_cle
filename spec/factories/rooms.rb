FactoryBot.define do
  factory :room do
    artist_name { Faker::Team.name }
    genre_id    { 1 }

    after(:build) do |room|
      room.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
