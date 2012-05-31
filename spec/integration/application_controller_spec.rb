require "spec_helper"

module Gemdocs
  describe Middleware do
    it "should receive requests to /gemdocs" do
      get :gemdocs, :use_route => '/gemdocs'
      respone.should be_successful
    end
  end
end