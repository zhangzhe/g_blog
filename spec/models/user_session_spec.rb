require 'spec_helper'

describe UserSession do
  describe "initialize(session)" do 
    it "should initialize and set locale" do 
      session = {:first_key => "first_value"}
      user_session = UserSession.new(session)
      user_session.locale.should == :en
    end
  end
  
  describe "locale=" do 
    it "should set locale value" do 
      session = {:first_key => "first_value"}
      user_session = UserSession.new(session)
      user_session.locale= :zh
      user_session.locale.should == :zh
    end
  end
end
