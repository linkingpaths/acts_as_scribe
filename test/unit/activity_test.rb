require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ActivityTest < Test::Unit::TestCase

  should_belong_to :user
  should_belong_to :item

  context 'An Activity model' do
    
    setup do
      @margie = Factory(:user, :login => 'm.thatcher')
      @britain = Factory(:jaiku, :content => "To solve Britain’s economic Disease with Socialism is like treating leukaemia with leeches.", :user => @margie)
      @margie_activities =  @britain.activities

      @reagan = Factory(:user, :login => 'r.reagan')
      @reagan.record_activity :logged_in
    end
    
    context 'at class level' do
      should 'have a `created_by` method to allow us to find activities created by a given user' do
        assert Activity.respond_to?:created_by
        assert_same_elements @margie_activities, Activity.created_by(@margie)
      end
      should 'have a `without_model_created_by` method to allow us to find activities created by a given user and not related to any item' do
        assert Activity.respond_to?:without_model_created_by
        assert_same_elements @reagan.activities, Activity.without_model_created_by(@reagan)
      end
    end
    context 'at instance level' do
      should 'be linked to the correct item' do
        assert_equal @britain, @britain.activities.first.item
      end
      should 'not be linked to any item is the activity has been generated without a model' do
        assert_nil @reagan.activities.first.item
        assert @reagan.activities.first.without_model?
      end
    end

  end
end
