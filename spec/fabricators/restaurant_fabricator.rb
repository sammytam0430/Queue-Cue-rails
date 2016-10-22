Fabricator(:restaurant) do
  name { Faker::Company.name }
  food_type { Faker::Address.country }
  location { Faker::Address.city }
end
