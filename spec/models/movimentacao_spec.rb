require File.dirname(__FILE__) + '/../spec_helper'

describe Movimentacao do
  it "should be valid" do
    Movimentacao.new.should be_valid
  end
end
