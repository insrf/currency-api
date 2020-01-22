FactoryBot.define do
  sequence :name do |n|
    "MyString#{n}"
  end

  factory :curency do
    name { "MyString" }
    rate { 1.5 }
  end

  factory :random_curency, class: "Curency" do
    name { generate(:name) }
    rate { 1.5 }
  end
end
