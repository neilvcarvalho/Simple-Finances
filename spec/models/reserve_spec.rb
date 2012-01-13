require File.dirname(__FILE__) + '/../spec_helper'

describe Reserve do
	before(:each) do
		@reserve = Factory.build(:reserve)
	end

	it "should save" do
		@reserve.save.should be_true
	end

	it "should be associated to an account" do
		@conta = Factory.create(:conta)
		@reserve.conta = @conta
		@reserve.save
		@reserve.conta.should be @conta
	end
end
