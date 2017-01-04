FactoryGirl.define do
  factory :contractor do
    name "Toolman"
    contact "Tim Taylor"
    email "tim@email.com"
    phone "555-555-5555"
    states_serviced ["MN", "WI", "ND"]
  end
end
