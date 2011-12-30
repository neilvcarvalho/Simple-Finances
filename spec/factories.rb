FactoryGirl.define do
	factory :conta do
		saldo 1000
		descricao "Foo"
	end

	factory :user do
		sequence(:email) { |n| "mail#{n}@mail.com"}
		password "foobar123"
		password_confirmation "foobar123"
	end
end