FactoryGirl.define do
  factory :user do
    name "John Doh"
    email "john@doh.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :contribution do
    user
    #recipe  #created circule reference - not needed for tesitng.
  end

  factory :step do
    content "Mix up the ingredients"
  end

  factory :ingredient do
    name "Pork Chops"
  end

  factory :addition do
    quantity "2 lbs"
    ingredient
  end

  factory :recipe do
    title "Maple Balsamic Pork Chops"
    after(:build) do |recipe|
      recipe.contributions << FactoryGirl.create(:contribution)
      recipe.additions << FactoryGirl.create(:addition)
      recipe.steps << FactoryGirl.create(:step)
    end
  end

end