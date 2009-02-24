require File.dirname(__FILE__) + '/../spec_helper'

describe "Activity" do
  
  describe "when creating an instance of a model with a actor != user" do
    before do
      @p = Factory :post
      @act = Activity.last
    end
    it "should find the created activity by the user" do
      @act.user.should == @p.author
    end
  end
  
  describe "when creating an instance of a model with a :if option" do
    before do
      @p = Factory(:post, :private => true)
    end
    it "should not create the activity" do
      Activity.by_item(@p).should have(0).things
    end
  end
  
  describe "when creating a new instance of a tracked model" do
    before do
      @m = Factory :membership
      @act = Activity.last
    end
    it "should find the created activity by the user" do
      Activity.by_user(@m.user).should include(@act)
    end
    it "should find the created activity by an users list" do
      Activity.by_user([@m.user, Factory(:user)]).should include(@act)
    end
    it "should find the created activity by the action" do
      Activity.by_action(:create).should include(@act)
    end
    it "should find the created activity by the item" do
      Activity.by_item(@m).should include(@act)
    end
    it "should find the created activity by the creation date" do
      Activity.created_since(5.second.ago).should include(@act)
    end
    it "should be related to an user" do
      @act.should respond_to(:user)
    end
    it "should be related to an item" do
      @act.should respond_to(:item)
    end
  end

  describe "when destroying an instance of a tracked model" do
    before do
      Factory(:membership).destroy
      @act = Activity.last
    end
    it "should find the created activity by the action" do
      Activity.by_action(:destroy).should include(@act)
    end
  end

  describe "when reporting a specific action" do
    it "should create a new activity" do
      lambda { 
        Activity.report(Factory(:user), :grant_admin, Factory(:group))  
      }.should change(Activity, :count).by(1)
    end    
    it "should allow to report actions without a item" do
      Activity.report(Factory(:user), :login)  
    end
  end

end
