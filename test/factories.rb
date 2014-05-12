FactoryGirl.define do
  factory :user do
    name "John Doh"
    email "john@doh.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :contribution do
    recipe
    user
  end

  factory :step do
    content "Mix up the ingredients"
  end

  factory :ingredient do
    name "Pork Chops"
  end

  factory :addition do
    ingredient
  end

  factory :recipe do
    title "Maple Balsamic Pork Chops"
    contribution
    addition
    step
  end

end