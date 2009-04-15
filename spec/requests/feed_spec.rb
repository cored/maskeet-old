require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/feed" do
  before(:each) do
    @response = request("/feed")
  end
end