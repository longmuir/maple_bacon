FactoryGirl.define do
  factory :user do
    name "John Doh"
    email "john@doh.com"
    password "foobar"
    password_confirmation "foobar"
  end
end