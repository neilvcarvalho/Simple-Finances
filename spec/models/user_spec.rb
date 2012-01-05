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

	it "should calculate his balance" do
		@user.save
		conta1 = Factory.create(:conta)
		conta2 = Factory.create(:conta)
		@user.contas << [conta1, conta2]
		FactoryGirl.create(:movimentacao, quantia: 1000, conta: conta1, tipo: "E")
		FactoryGirl.create(:movimentacao, quantia: 500, conta: conta1, tipo: "S")
		FactoryGirl.create(:movimentacao, quantia: 200, conta: conta1, tipo: "T", conta_destino_id: conta2.id)
		@user.monthly_balance.should == 500
	end
end
