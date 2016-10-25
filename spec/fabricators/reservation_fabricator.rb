Fabricator(:reservation) do
  party_size { Faker::Number.number(1) }
  customer
  restaurant
end
