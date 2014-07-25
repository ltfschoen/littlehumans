# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # Define a basic devise user.
  factory :user do
    name {"bob#{rand(100)}"}
    email { "#{name}.@example.com".downcase }
    password "monkeyblink182"
    password_confirmation "monkeyblink182"
  end

end


