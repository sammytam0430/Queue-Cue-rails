Fabricator(:customer) do
  name { Faker::Name.name }
  phone_number { Faker::Number.number(10) }
  email { Faker::Internet.email }
end
