require File.dirname(__FILE__) + '/../spec_helper'

describe Categoria do
  it "should be valid" do
    Categoria.new.should be_valid
  end
end
