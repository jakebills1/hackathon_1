



User.destroy_all();

User.create(
    avatar: "https://robohash.org/#{Faker::Color.hex_color()}",
    first_name: Faker::Name.first_name(),
    last_name: Faker::Name.last_name(),
    email: "fake@mail.com",
    password: "password",
)


for i in (1..5)
    user = User.create(
        avatar: "https://robohash.org/#{Faker::Color.hex_color()}",
        first_name: Faker::Name.first_name(),
        last_name: Faker::Name.last_name(),
        email: Faker::Internet.email(),
        password: "password",
    )
end

User.all().each() {|user|
    for i in (1..5)
        trip = Trip.create(
            user_id: user.id,
            name: Faker::Name.name(),
        )

        for i in (1..5)
            location = Location.create(
                trip_id: trip.id,
                city: Faker::Address.city(),
                state: Faker::Address.state(),
                country: Faker::Address.country(),
            )

            Address.create(
                location_id: location.id,
                street_address: Faker::Address.full_address(),
            )
        end
    end
}

puts "_____Database_Seeded_____"

