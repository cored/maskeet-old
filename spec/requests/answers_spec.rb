require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/answers" do
  before(:each) do
    @response = request("/answers")
  end
end