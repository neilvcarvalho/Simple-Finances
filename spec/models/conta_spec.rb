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
end
