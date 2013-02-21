require 'spec_helper'

describe ToyType do
  it "should create a new ToyType" do
    ToyType.new.should be_kind_of(ToyType)
  end

  it "should validate the presence of name" do
    expect(ToyType.create(img: "fake_image")).to raise_exception
  end
end
