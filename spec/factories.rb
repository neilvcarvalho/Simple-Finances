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

	factory :categoria do
		descricao "Gastos pessoais"
		association :user
	end

	factory :movimentacao do
		association :categoria
		quantia 100
		association :conta
		tipo "S" # E, S ou T
		date Time.now
	end
end