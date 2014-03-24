# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {"bob#{rand(100)}"}
    email { "#{name}.@example.com".downcase }
    password "monkeyblink182"
  end

end


