require File.dirname(__FILE__) + '/../spec_helper'

describe Movimentacao do
	before(:each) do
		@movimentacao = Factory.build(:movimentacao)
	end

	it "should not save without an amout" do
		@movimentacao.quantia = nil
		@movimentacao.save.should be_false
		@movimentacao.quantia = 0
		@movimentacao.save.should be_false
	end

	it "should belong to an account" do
		@movimentacao.conta_id = nil
		@movimentacao.save.should be_false
	end

	it "should update its account balance after save and deletion" do
		conta = Factory.create(:conta, saldo: 100)
		movimentacao = Factory.create(:movimentacao, tipo: "S", conta: conta, quantia: 10)
		conta.saldo.should == 90
		movimentacao2 = Factory.create(:movimentacao, tipo: "E", conta: conta, quantia: 30)
		conta.saldo.should == 120
		movimentacao2.destroy
		conta.saldo.should == 90
	end
end
