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

	it "must belong to an account" do
		@movimentacao.conta_id = nil
		@movimentacao.save.should be_false
	end
end
