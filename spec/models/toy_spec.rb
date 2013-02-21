require 'spec_helper'

describe Toy do
  it "should exist" do
    Toy.new.should be_kind_of(Toy)
  end

  it "should not be saved if not embedded in ToyType" do
    expect { Toy.create(name: "Test Toy") }.to raise_error(Mongoid::Errors::NoParent)
  end

  it "should validate the presence of name" do
    toy = Toy.new
    toy.valid?.should be_false
    toy.name = "Test Name"
    toy.valid?.should be_true
  end

end

