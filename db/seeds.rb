require 'faker'

BuyerProperty.destroy_all
Property.destroy_all
User.destroy_all

5.times do |n|
  user = User.new(
    email: "user#{n+1}@mail.com",
    user_type: rand(2),
    name: Faker::Name.first_name,
    phone: "12345678#{n+1}".to_i,
    password: "letmein"
  )

  if user.save
    puts "user#{n+1} created succesfully"
    if user.user_type == "landlord"
      5.times do |n|
        contract = rand(2)
        property = Property.new(
          address: Faker::Address.full_address,
          price: Faker::Number.number(digits: 8),
          maintenance: contract.zero? ? Faker::Number.number(digits: 3) : nil,
          property_type: rand(2),
          pets: rand(2) == 1 ? true : false,
          lat: -11.997058935306287,
          long: -77.05497094430477,
          image_urls: [
            "https://www.aveliving.com/AVE/media/Property_Images/Florham%20Park/hero/flor-apt-living-(2)-hero.jpg?ext=.jpg",
            "https://image1.apartmentfinder.com/i2/DoSkR2Q6HnD7k7exBblnHcPtkR_0qNnddaO0dCfUgMY/110/image.jpg"
          ],
          about: "Great place to live",
          bedrooms: rand(1...4),
          bathrooms: rand(1...3),
          area: rand(80...300),
          operation_type: contract,
          user: user,
        )
        if property.save
          puts "Property created succesfully"
        else
          puts "property#{n+1} #{property.errors.full_messages.join(", ")}"
        end
      end
    end
  else
    puts "user#{n+1} #{user.errors.full_messages.join(", ")}"
  end
end