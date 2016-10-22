Fabricator(:customer) do
  name { Faker::Company.name }
  food_type { Faker::Address.country }
  email { Faker::Address.city }
end
