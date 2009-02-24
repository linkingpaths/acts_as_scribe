Given /^I'm a user$/ do
  @me = Factory :user
end

When /^I create a membership$/ do
  @creating_membership = lambda do
    @membership = Factory :membership, :user => @me 
  end
end

Then /^a new activity should be reported$/ do
  @creating_membership.should change(Activity, :count).by(1)
end
Then /^the activity should be related to me$/ do
  acts = Activity.by_item(@membership)
  acts.should have(1).things
  acts.first.user.should == @me
end

