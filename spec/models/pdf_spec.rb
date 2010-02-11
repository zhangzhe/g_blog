require 'spec_helper'

describe Pdf do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Pdf.create!(@valid_attributes)
  end
end
