require "spec_helper"

module Gemdocs
  describe Router do
    it "should override the default YARD::Server paths to the gemdoc namespace" do
      pending
    end
    
    it "should define a rails engine" do
      Gemdocs::Engine.should be_present
    end
  end  
end