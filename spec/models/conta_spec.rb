require File.dirname(__FILE__) + '/../spec_helper'

describe Conta do
	before(:each) do
		@conta = FactoryGirl.create(:conta)
	end

	it "should belong to an user" do
		user = FactoryGirl.create(:user)
		@conta.users << user
		@conta.save
		@conta.users.should include(user)
	end

	it "should not save without a description" do
		@conta.descricao = nil
		@conta.save.should be_false
	end

	it "should not save without a balance" do
		@conta.saldo = nil
		@conta.save.should be_false
	end

	it "should calculate its monthly balance" do
		@conta.save
		conta2 = Factory.create(:conta)
		FactoryGirl.create(:movimentacao, quantia: 1000, conta: @conta, tipo: "E")
		FactoryGirl.create(:movimentacao, quantia: 500, conta: @conta, tipo: "S")
		FactoryGirl.create(:movimentacao, quantia: 200, conta: @conta, tipo: "T", conta_destino_id: conta2.id)
		@conta.monthly_balance.to_f.should == 300
		conta2.monthly_balance.to_f.should == 200
	end

	it "should ignore the reserve when calculating the monthly balance" do
		@conta.save
		FactoryGirl.create(:reserve, sum: 100, conta: @conta)
		FactoryGirl.create(:movimentacao, quantia: 1000, conta: @conta, tipo: "E")
		FactoryGirl.create(:movimentacao, quantia: 500, conta: @conta, tipo: "S")
		@conta.monthly_balance.should == 400
	end
end
