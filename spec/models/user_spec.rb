require 'spec_helper'

describe User do
	before(:each) do
		@user = FactoryGirl.build(:user)
	end
	it "should save" do
		@user.save.should be_true
	end
	it "should create basic accounts when creating an user" do
		@user.save
		@user.contas.size.should > 0
	end

	it "should create basic categories when creating an user" do
		@user.save
		@user.categorias.size.should > 0
	end
end
