require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a question exists" do
  Question.all.destroy!
  request(resource(:question), :method => "POST", 
    :params => { :question => { :id => nil }})
end

describe "resource(:question)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:question))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of question" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a question exists" do
    before(:each) do
      @response = request(resource(:question))
    end
    
    it "has a list of question" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Question.all.destroy!
      @response = request(resource(:question), :method => "POST", 
        :params => { :question => { :id => nil }})
    end
    
    it "redirects to resource(:question)" do
      @response.should redirect_to(resource(Question.first), :message => {:notice => "question was successfully created"})
    end
    
  end
end

describe "resource(@question)" do 
  describe "a successful DELETE", :given => "a question exists" do
     before(:each) do
       @response = request(resource(Question.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:question))
     end

   end
end

describe "resource(:question, :new)" do
  before(:each) do
    @response = request(resource(:question, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@question, :edit)", :given => "a question exists" do
  before(:each) do
    @response = request(resource(Question.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@question)", :given => "a question exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Question.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @question = Question.first
      @response = request(resource(@question), :method => "PUT", 
        :params => { :question => {:id => @question.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@question))
    end
  end
  
end

